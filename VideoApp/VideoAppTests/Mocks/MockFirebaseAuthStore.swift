//
//  MockFirebaseAuthStore.swift
//  Video-TwilioTests
//
//  Created by Tim Rozum on 10/16/19.
//  Copyright © 2019 Twilio, Inc. All rights reserved.
//

@testable import VideoApp

class MockFirebaseAuthStore: FirebaseAuthStoreWriting {
    var invokedDelegateSetter = false
    var invokedDelegateSetterCount = 0
    var invokedDelegate: AuthStoreWritingDelegate?
    var invokedDelegateList = [AuthStoreWritingDelegate?]()
    var invokedDelegateGetter = false
    var invokedDelegateGetterCount = 0
    var stubbedDelegate: AuthStoreWritingDelegate!
    var delegate: AuthStoreWritingDelegate? {
        set {
            invokedDelegateSetter = true
            invokedDelegateSetterCount += 1
            invokedDelegate = newValue
            invokedDelegateList.append(newValue)
        }
        get {
            invokedDelegateGetter = true
            invokedDelegateGetterCount += 1
            return stubbedDelegate
        }
    }
    var invokedIsSignedInGetter = false
    var invokedIsSignedInGetterCount = 0
    var stubbedIsSignedIn: Bool! = false
    var isSignedIn: Bool {
        invokedIsSignedInGetter = true
        invokedIsSignedInGetterCount += 1
        return stubbedIsSignedIn
    }
    var invokedUserDisplayNameGetter = false
    var invokedUserDisplayNameGetterCount = 0
    var stubbedUserDisplayName: String! = ""
    var userDisplayName: String {
        invokedUserDisplayNameGetter = true
        invokedUserDisplayNameGetterCount += 1
        return stubbedUserDisplayName
    }
    var invokedFetchAccessToken = false
    var invokedFetchAccessTokenCount = 0
    var stubbedFetchAccessTokenCompletionResult: (String?, Error?)?
    func fetchAccessToken(completion: @escaping (String?, Error?) -> Void) {
        invokedFetchAccessToken = true
        invokedFetchAccessTokenCount += 1
        if let result = stubbedFetchAccessTokenCompletionResult {
            completion(result.0, result.1)
        }
    }
    var invokedStart = false
    var invokedStartCount = 0
    func start() {
        invokedStart = true
        invokedStartCount += 1
    }
    var invokedSignIn = false
    var invokedSignInCount = 0
    var invokedSignInParameters: (email: String, password: String)?
    var invokedSignInParametersList = [(email: String, password: String)]()
    var stubbedSignInCompletionResult: (Error?, Void)?
    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        invokedSignIn = true
        invokedSignInCount += 1
        invokedSignInParameters = (email, password)
        invokedSignInParametersList.append((email, password))
        if let result = stubbedSignInCompletionResult {
            completion(result.0)
        }
    }
    var invokedSignOut = false
    var invokedSignOutCount = 0
    func signOut() {
        invokedSignOut = true
        invokedSignOutCount += 1
    }
    var invokedOpenURL = false
    var invokedOpenURLCount = 0
    var invokedOpenURLParameters: (url: URL, sourceApplication: String?, annotation: Any?)?
    var invokedOpenURLParametersList = [(url: URL, sourceApplication: String?, annotation: Any?)]()
    var stubbedOpenURLResult: Bool! = false
    func openURL(_ url: URL, sourceApplication: String?, annotation: Any?) -> Bool {
        invokedOpenURL = true
        invokedOpenURLCount += 1
        invokedOpenURLParameters = (url, sourceApplication, annotation)
        invokedOpenURLParametersList.append((url, sourceApplication, annotation))
        return stubbedOpenURLResult
    }
}
