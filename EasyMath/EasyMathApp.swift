//
//  EasyMathApp.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseMessaging
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Эй Firebase, подключись к моему приложению"
        FirebaseApp.configure()
        
        // FCM токен = это адрес, куда слать письмо, “Окей, вот уникальный адрес для этого устройства”, “Firebase, когда узнаешь адрес — скажи его мне”
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    // добавтла этот код чтобы сообщение приходило даже когда мое приложение открыто
    // Здесь ты получаешь FCM token
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        guard let token = fcmToken else { return }
        
        print("FCM token: \(token)")
    }
    
    // Push показывается когда приложение открыто
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound, .badge])
    }
    
    // Привязываем APNs токен к FCM
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        print("APNs token mapped to FCM")
    }
    
}

@main
struct EasyMathApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Stores app state
    @State var model = MainViewModel()
    @State var quizModel = QuizViewModel()
    @State var resultModel = ResultViewModel()
    @State var rewardsModel = RewardsViewModel()
    
    @State var onboardingModel = OnboardingViewModel()
    
    // Controls onboarding presentation
    @AppStorage("onboarding") var needsOnboarding = true
    @AppStorage("showNotificationPermission") var showNotificationPermission = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
            // Pass model to all child views
                .environment(model)
                .environment(quizModel)
                .environment(resultModel)
                .environment(rewardsModel)
                .modelContainer(for: [Score.self, Profile.self])
                .onAppear(perform: {
                    if !needsOnboarding {
                        askForNotificationIfNeeded()
                    }
                })
                .onChange(of: needsOnboarding) { oldValue, newValue in
                    if !newValue {
                        askForNotificationIfNeeded()
                    }
                }
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(onboardingModel)
                        .environment(model)
                        .modelContainer(for: [Score.self, Profile.self])
                }
        }
    }
    
    // Спрашиваем разрешение у пользователя на уведомления
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            DispatchQueue.main.async {
                if granted {
                    // Ты регистрируешься в системе уведомлений
                    UIApplication.shared.registerForRemoteNotifications()
                    // Включаем Firebase уведомления
                    Messaging.messaging().isAutoInitEnabled = true
                }
            }
        }
    }
    
    func askForNotificationIfNeeded() {
        guard !showNotificationPermission else {
            return
        }
        
        // “сделай что-то через 1 секунду”
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // запрос на отправку уведомлений
            requestNotificationPermission()
            showNotificationPermission = true
        }
    }
}
