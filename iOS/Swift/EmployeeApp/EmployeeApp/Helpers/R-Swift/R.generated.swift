//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle

  let reuseIdentifier = reuseIdentifier()

  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var nib: nib { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func nib(bundle: Foundation.Bundle) -> nib {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
    try self.nib.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 56 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: Add
      ///
      /// Key: add
      ///
      /// Locales: en
      var add: RswiftResources.StringResource { .init(key: "add", tableName: "Localizable", source: source, developmentValue: "Add", comment: nil) }

      /// en translation: Add a description
      ///
      /// Key: add.description.placeholder
      ///
      /// Locales: en
      var addDescriptionPlaceholder: RswiftResources.StringResource { .init(key: "add.description.placeholder", tableName: "Localizable", source: source, developmentValue: "Add a description", comment: nil) }

      /// en translation: Anonymous
      ///
      /// Key: anonymous
      ///
      /// Locales: en
      var anonymous: RswiftResources.StringResource { .init(key: "anonymous", tableName: "Localizable", source: source, developmentValue: "Anonymous", comment: nil) }

      /// en translation: Any
      ///
      /// Key: any
      ///
      /// Locales: en
      var any: RswiftResources.StringResource { .init(key: "any", tableName: "Localizable", source: source, developmentValue: "Any", comment: nil) }

      /// en translation: Back
      ///
      /// Key: back
      ///
      /// Locales: en
      var back: RswiftResources.StringResource { .init(key: "back", tableName: "Localizable", source: source, developmentValue: "Back", comment: nil) }

      /// en translation: Cancel
      ///
      /// Key: cancel
      ///
      /// Locales: en
      var cancel: RswiftResources.StringResource { .init(key: "cancel", tableName: "Localizable", source: source, developmentValue: "Cancel", comment: nil) }

      /// en translation: Clear
      ///
      /// Key: clear
      ///
      /// Locales: en
      var clear: RswiftResources.StringResource { .init(key: "clear", tableName: "Localizable", source: source, developmentValue: "Clear", comment: nil) }

      /// en translation: Close
      ///
      /// Key: close
      ///
      /// Locales: en
      var close: RswiftResources.StringResource { .init(key: "close", tableName: "Localizable", source: source, developmentValue: "Close", comment: nil) }

      /// en translation: Confirm Password
      ///
      /// Key: confirm.password
      ///
      /// Locales: en
      var confirmPassword: RswiftResources.StringResource { .init(key: "confirm.password", tableName: "Localizable", source: source, developmentValue: "Confirm Password", comment: nil) }

      /// en translation: Continue
      ///
      /// Key: continue
      ///
      /// Locales: en
      var `continue`: RswiftResources.StringResource { .init(key: "continue", tableName: "Localizable", source: source, developmentValue: "Continue", comment: nil) }

      /// en translation: Please add a description.
      ///
      /// Key: create.post.error.description-required
      ///
      /// Locales: en
      var createPostErrorDescriptionRequired: RswiftResources.StringResource { .init(key: "create.post.error.description-required", tableName: "Localizable", source: source, developmentValue: "Please add a description.", comment: nil) }

      /// en translation: Please add an image.
      ///
      /// Key: create.post.error.image-required
      ///
      /// Locales: en
      var createPostErrorImageRequired: RswiftResources.StringResource { .init(key: "create.post.error.image-required", tableName: "Localizable", source: source, developmentValue: "Please add an image.", comment: nil) }

      /// en translation: Creating
      ///
      /// Key: creating
      ///
      /// Locales: en
      var creating: RswiftResources.StringResource { .init(key: "creating", tableName: "Localizable", source: source, developmentValue: "Creating", comment: nil) }

      /// en translation: Default
      ///
      /// Key: default
      ///
      /// Locales: en
      var `default`: RswiftResources.StringResource { .init(key: "default", tableName: "Localizable", source: source, developmentValue: "Default", comment: nil) }

      /// en translation: Delete
      ///
      /// Key: delete
      ///
      /// Locales: en
      var delete: RswiftResources.StringResource { .init(key: "delete", tableName: "Localizable", source: source, developmentValue: "Delete", comment: nil) }

      /// en translation: Description
      ///
      /// Key: description
      ///
      /// Locales: en
      var description: RswiftResources.StringResource { .init(key: "description", tableName: "Localizable", source: source, developmentValue: "Description", comment: nil) }

      /// en translation: Dismiss
      ///
      /// Key: dismiss
      ///
      /// Locales: en
      var dismiss: RswiftResources.StringResource { .init(key: "dismiss", tableName: "Localizable", source: source, developmentValue: "Dismiss", comment: nil) }

      /// en translation: %dkm
      ///
      /// Key: distance.in.km
      ///
      /// Locales: en
      var distanceInKm: RswiftResources.StringResource1<Int> { .init(key: "distance.in.km", tableName: "Localizable", source: source, developmentValue: "%dkm", comment: nil) }

      /// en translation: Done
      ///
      /// Key: done
      ///
      /// Locales: en
      var done: RswiftResources.StringResource { .init(key: "done", tableName: "Localizable", source: source, developmentValue: "Done", comment: nil) }

      /// en translation: Edit
      ///
      /// Key: edit
      ///
      /// Locales: en
      var edit: RswiftResources.StringResource { .init(key: "edit", tableName: "Localizable", source: source, developmentValue: "Edit", comment: nil) }

      /// en translation: Email
      ///
      /// Key: email
      ///
      /// Locales: en
      var email: RswiftResources.StringResource { .init(key: "email", tableName: "Localizable", source: source, developmentValue: "Email", comment: nil) }

      /// en translation: Error
      ///
      /// Key: error
      ///
      /// Locales: en
      var error: RswiftResources.StringResource { .init(key: "error", tableName: "Localizable", source: source, developmentValue: "Error", comment: nil) }

      /// en translation: Filters
      ///
      /// Key: filters
      ///
      /// Locales: en
      var filters: RswiftResources.StringResource { .init(key: "filters", tableName: "Localizable", source: source, developmentValue: "Filters", comment: nil) }

      /// en translation: First Name
      ///
      /// Key: first.name
      ///
      /// Locales: en
      var firstName: RswiftResources.StringResource { .init(key: "first.name", tableName: "Localizable", source: source, developmentValue: "First Name", comment: nil) }

      /// en translation: Hide
      ///
      /// Key: hide
      ///
      /// Locales: en
      var hide: RswiftResources.StringResource { .init(key: "hide", tableName: "Localizable", source: source, developmentValue: "Hide", comment: nil) }

      /// en translation: Sorry, this app will not run in JailBroken devices
      ///
      /// Key: jailBroken.message
      ///
      /// Locales: en
      var jailBrokenMessage: RswiftResources.StringResource { .init(key: "jailBroken.message", tableName: "Localizable", source: source, developmentValue: "Sorry, this app will not run in JailBroken devices", comment: nil) }

      /// en translation: Jail Broken Device Detected
      ///
      /// Key: jailBroken.title
      ///
      /// Locales: en
      var jailBrokenTitle: RswiftResources.StringResource { .init(key: "jailBroken.title", tableName: "Localizable", source: source, developmentValue: "Jail Broken Device Detected", comment: nil) }

      /// en translation: Last Name
      ///
      /// Key: last.name
      ///
      /// Locales: en
      var lastName: RswiftResources.StringResource { .init(key: "last.name", tableName: "Localizable", source: source, developmentValue: "Last Name", comment: nil) }

      /// en translation: Later
      ///
      /// Key: later
      ///
      /// Locales: en
      var later: RswiftResources.StringResource { .init(key: "later", tableName: "Localizable", source: source, developmentValue: "Later", comment: nil) }

      /// en translation: Log In
      ///
      /// Key: login
      ///
      /// Locales: en
      var login: RswiftResources.StringResource { .init(key: "login", tableName: "Localizable", source: source, developmentValue: "Log In", comment: nil) }

      /// en translation: Log out
      ///
      /// Key: logout
      ///
      /// Locales: en
      var logout: RswiftResources.StringResource { .init(key: "logout", tableName: "Localizable", source: source, developmentValue: "Log out", comment: nil) }

      /// en translation: No
      ///
      /// Key: no
      ///
      /// Locales: en
      var no: RswiftResources.StringResource { .init(key: "no", tableName: "Localizable", source: source, developmentValue: "No", comment: nil) }

      /// en translation: Okay
      ///
      /// Key: okay
      ///
      /// Locales: en
      var okay: RswiftResources.StringResource { .init(key: "okay", tableName: "Localizable", source: source, developmentValue: "Okay", comment: nil) }

      /// en translation: Password
      ///
      /// Key: password
      ///
      /// Locales: en
      var password: RswiftResources.StringResource { .init(key: "password", tableName: "Localizable", source: source, developmentValue: "Password", comment: nil) }

      /// en translation: Personal Skills
      ///
      /// Key: personal.skills
      ///
      /// Locales: en
      var personalSkills: RswiftResources.StringResource { .init(key: "personal.skills", tableName: "Localizable", source: source, developmentValue: "Personal Skills", comment: nil) }

      /// en translation: Phone Number
      ///
      /// Key: phone-number
      ///
      /// Locales: en
      var phoneNumber: RswiftResources.StringResource { .init(key: "phone-number", tableName: "Localizable", source: source, developmentValue: "Phone Number", comment: nil) }

      /// en translation: %@s
      ///
      /// Key: plural
      ///
      /// Locales: en
      var plural: RswiftResources.StringResource1<String> { .init(key: "plural", tableName: "Localizable", source: source, developmentValue: "%@s", comment: nil) }

      /// en translation: Block
      ///
      /// Key: post.block
      ///
      /// Locales: en
      var postBlock: RswiftResources.StringResource { .init(key: "post.block", tableName: "Localizable", source: source, developmentValue: "Block", comment: nil) }

      /// en translation: Block User
      ///
      /// Key: post.block.user
      ///
      /// Locales: en
      var postBlockUser: RswiftResources.StringResource { .init(key: "post.block.user", tableName: "Localizable", source: source, developmentValue: "Block User", comment: nil) }

      /// en translation: You won't see any posts from this user moving forward
      ///
      /// Key: post.block.user.dialog.message
      ///
      /// Locales: en
      var postBlockUserDialogMessage: RswiftResources.StringResource { .init(key: "post.block.user.dialog.message", tableName: "Localizable", source: source, developmentValue: "You won't see any posts from this user moving forward", comment: nil) }

      /// en translation: Are you sure?
      ///
      /// Key: post.block.user.dialog.title
      ///
      /// Locales: en
      var postBlockUserDialogTitle: RswiftResources.StringResource { .init(key: "post.block.user.dialog.title", tableName: "Localizable", source: source, developmentValue: "Are you sure?", comment: nil) }

      /// en translation: Privacy Policy
      ///
      /// Key: privacy.policy
      ///
      /// Locales: en
      var privacyPolicy: RswiftResources.StringResource { .init(key: "privacy.policy", tableName: "Localizable", source: source, developmentValue: "Privacy Policy", comment: nil) }

      /// en translation: Report Post
      ///
      /// Key: report.post
      ///
      /// Locales: en
      var reportPost: RswiftResources.StringResource { .init(key: "report.post", tableName: "Localizable", source: source, developmentValue: "Report Post", comment: nil) }

      /// en translation: Report
      ///
      /// Key: report.title
      ///
      /// Locales: en
      var reportTitle: RswiftResources.StringResource { .init(key: "report.title", tableName: "Localizable", source: source, developmentValue: "Report", comment: nil) }

      /// en translation: Resend
      ///
      /// Key: resend
      ///
      /// Locales: en
      var resend: RswiftResources.StringResource { .init(key: "resend", tableName: "Localizable", source: source, developmentValue: "Resend", comment: nil) }

      /// en translation: Resend Code in %@
      ///
      /// Key: resendCodeIn
      ///
      /// Locales: en
      var resendCodeIn: RswiftResources.StringResource1<String> { .init(key: "resendCodeIn", tableName: "Localizable", source: source, developmentValue: "Resend Code in %@", comment: nil) }

      /// en translation: Reset
      ///
      /// Key: reset
      ///
      /// Locales: en
      var reset: RswiftResources.StringResource { .init(key: "reset", tableName: "Localizable", source: source, developmentValue: "Reset", comment: nil) }

      /// en translation: Save
      ///
      /// Key: save
      ///
      /// Locales: en
      var save: RswiftResources.StringResource { .init(key: "save", tableName: "Localizable", source: source, developmentValue: "Save", comment: nil) }

      /// en translation: Settings
      ///
      /// Key: settings
      ///
      /// Locales: en
      var settings: RswiftResources.StringResource { .init(key: "settings", tableName: "Localizable", source: source, developmentValue: "Settings", comment: nil) }

      /// en translation: Skip
      ///
      /// Key: skip
      ///
      /// Locales: en
      var skip: RswiftResources.StringResource { .init(key: "skip", tableName: "Localizable", source: source, developmentValue: "Skip", comment: nil) }

      /// en translation: Success
      ///
      /// Key: status.success
      ///
      /// Locales: en
      var statusSuccess: RswiftResources.StringResource { .init(key: "status.success", tableName: "Localizable", source: source, developmentValue: "Success", comment: nil) }

      /// en translation: Technical Skills
      ///
      /// Key: technical.skills
      ///
      /// Locales: en
      var technicalSkills: RswiftResources.StringResource { .init(key: "technical.skills", tableName: "Localizable", source: source, developmentValue: "Technical Skills", comment: nil) }

      /// en translation: Terms and Conditions
      ///
      /// Key: terms.condition
      ///
      /// Locales: en
      var termsCondition: RswiftResources.StringResource { .init(key: "terms.condition", tableName: "Localizable", source: source, developmentValue: "Terms and Conditions", comment: nil) }

      /// en translation: Unfollow
      ///
      /// Key: unfollow
      ///
      /// Locales: en
      var unfollow: RswiftResources.StringResource { .init(key: "unfollow", tableName: "Localizable", source: source, developmentValue: "Unfollow", comment: nil) }

      /// en translation: Updating
      ///
      /// Key: updating
      ///
      /// Locales: en
      var updating: RswiftResources.StringResource { .init(key: "updating", tableName: "Localizable", source: source, developmentValue: "Updating", comment: nil) }

      /// en translation: Yes
      ///
      /// Key: yes
      ///
      /// Locales: en
      var yes: RswiftResources.StringResource { .init(key: "yes", tableName: "Localizable", source: source, developmentValue: "Yes", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 19 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `Background Dark`.
    var backgroundDark: RswiftResources.ColorResource { .init(name: "Background Dark", path: [], bundle: bundle) }

    /// Color `Neutrals Background`.
    var neutralsBackground: RswiftResources.ColorResource { .init(name: "Neutrals Background", path: [], bundle: bundle) }

    /// Color `Neutrals Border Divider`.
    var neutralsBorderDivider: RswiftResources.ColorResource { .init(name: "Neutrals Border Divider", path: [], bundle: bundle) }

    /// Color `Neutrals Cards`.
    var neutralsCards: RswiftResources.ColorResource { .init(name: "Neutrals Cards", path: [], bundle: bundle) }

    /// Color `Neutrals Fields Tags`.
    var neutralsFieldsTags: RswiftResources.ColorResource { .init(name: "Neutrals Fields Tags", path: [], bundle: bundle) }

    /// Color `Primaries Default`.
    var primariesDefault: RswiftResources.ColorResource { .init(name: "Primaries Default", path: [], bundle: bundle) }

    /// Color `Primaries Shade 1`.
    var primariesShade1: RswiftResources.ColorResource { .init(name: "Primaries Shade 1", path: [], bundle: bundle) }

    /// Color `Primaries Shade 2`.
    var primariesShade2: RswiftResources.ColorResource { .init(name: "Primaries Shade 2", path: [], bundle: bundle) }

    /// Color `Primaries Shade 3`.
    var primariesShade3: RswiftResources.ColorResource { .init(name: "Primaries Shade 3", path: [], bundle: bundle) }

    /// Color `Semantics Error Full`.
    var semanticsErrorFull: RswiftResources.ColorResource { .init(name: "Semantics Error Full", path: [], bundle: bundle) }

    /// Color `Semantics Info Full`.
    var semanticsInfoFull: RswiftResources.ColorResource { .init(name: "Semantics Info Full", path: [], bundle: bundle) }

    /// Color `Semantics Success Full`.
    var semanticsSuccessFull: RswiftResources.ColorResource { .init(name: "Semantics Success Full", path: [], bundle: bundle) }

    /// Color `Semantics Warn Full`.
    var semanticsWarnFull: RswiftResources.ColorResource { .init(name: "Semantics Warn Full", path: [], bundle: bundle) }

    /// Color `Text Disabled`.
    var textDisabled: RswiftResources.ColorResource { .init(name: "Text Disabled", path: [], bundle: bundle) }

    /// Color `Text Primary`.
    var textPrimary: RswiftResources.ColorResource { .init(name: "Text Primary", path: [], bundle: bundle) }

    /// Color `Text Secondary`.
    var textSecondary: RswiftResources.ColorResource { .init(name: "Text Secondary", path: [], bundle: bundle) }

    /// Color `Text Tertiary`.
    var textTertiary: RswiftResources.ColorResource { .init(name: "Text Tertiary", path: [], bundle: bundle) }

    /// Color `Text White`.
    var textWhite: RswiftResources.ColorResource { .init(name: "Text White", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 9 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `employee-100`.
    var employee100: RswiftResources.ImageResource { .init(name: "employee-100", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `employees`.
    var employees: RswiftResources.ImageResource { .init(name: "employees", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic-add`.
    var icAdd: RswiftResources.ImageResource { .init(name: "ic-add", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic-back`.
    var icBack: RswiftResources.ImageResource { .init(name: "ic-back", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic-list-options`.
    var icListOptions: RswiftResources.ImageResource { .init(name: "ic-list-options", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `info-overlay-profpic`.
    var infoOverlayProfpic: RswiftResources.ImageResource { .init(name: "info-overlay-profpic", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `listing-img-1`.
    var listingImg1: RswiftResources.ImageResource { .init(name: "listing-img-1", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `logo-1902`.
    var logo1902: RswiftResources.ImageResource { .init(name: "logo-1902", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `portfolio-48`.
    var portfolio48: RswiftResources.ImageResource { .init(name: "portfolio-48", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
    }
  }

  /// This `_R.font` struct is generated, and contains static references to 12 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle

    /// Font `ProximaNova-Regular`.
    var proximaNovaRegular: RswiftResources.FontResource { .init(name: "ProximaNova-Regular", bundle: bundle, filename: "ProximaNova-Regular.ttf") }

    /// Font `ProximaNova-RegularIt`.
    var proximaNovaRegularIt: RswiftResources.FontResource { .init(name: "ProximaNova-RegularIt", bundle: bundle, filename: "ProximaNova-RegularIt.ttf") }

    /// Font `ProximaNova-Semibold`.
    var proximaNovaSemibold: RswiftResources.FontResource { .init(name: "ProximaNova-Semibold", bundle: bundle, filename: "ProximaNova-Semibold.ttf") }

    /// Font `ProximaNova-SemiboldIt`.
    var proximaNovaSemiboldIt: RswiftResources.FontResource { .init(name: "ProximaNova-SemiboldIt", bundle: bundle, filename: "ProximaNova-SemiboldIt.ttf") }

    /// Font `SFProDisplay-Bold`.
    var sfProDisplayBold: RswiftResources.FontResource { .init(name: "SFProDisplay-Bold", bundle: bundle, filename: "SFProDisplay-Bold.otf") }

    /// Font `SFProDisplay-Medium`.
    var sfProDisplayMedium: RswiftResources.FontResource { .init(name: "SFProDisplay-Medium", bundle: bundle, filename: "SFProDisplay-Medium.otf") }

    /// Font `SFProDisplay-Regular`.
    var sfProDisplayRegular: RswiftResources.FontResource { .init(name: "SFProDisplay-Regular", bundle: bundle, filename: "SFProDisplay-Regular.otf") }

    /// Font `SFProDisplay-Semibold`.
    var sfProDisplaySemibold: RswiftResources.FontResource { .init(name: "SFProDisplay-Semibold", bundle: bundle, filename: "SFProDisplay-Semibold.otf") }

    /// Font `SFProText-Bold`.
    var sfProTextBold: RswiftResources.FontResource { .init(name: "SFProText-Bold", bundle: bundle, filename: "SFProText-Bold.otf") }

    /// Font `SFProText-Medium`.
    var sfProTextMedium: RswiftResources.FontResource { .init(name: "SFProText-Medium", bundle: bundle, filename: "SFProText-Medium.otf") }

    /// Font `SFProText-Regular`.
    var sfProTextRegular: RswiftResources.FontResource { .init(name: "SFProText-Regular", bundle: bundle, filename: "SFProText-Regular.otf") }

    /// Font `SFProText-Semibold`.
    var sfProTextSemibold: RswiftResources.FontResource { .init(name: "SFProText-Semibold", bundle: bundle, filename: "SFProText-Semibold.otf") }

    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [proximaNovaRegular, proximaNovaRegularIt, proximaNovaSemibold, proximaNovaSemiboldIt, sfProDisplayBold, sfProDisplayMedium, sfProDisplayRegular, sfProDisplaySemibold, sfProTextBold, sfProTextMedium, sfProTextRegular, sfProTextSemibold].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 14 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `GoogleService-Info.plist`.
    var googleServiceInfoPlist: RswiftResources.FileResource { .init(name: "GoogleService-Info", pathExtension: "plist", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `ProximaNova-Regular.ttf`.
    var proximaNovaRegularTtf: RswiftResources.FileResource { .init(name: "ProximaNova-Regular", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `ProximaNova-RegularIt.ttf`.
    var proximaNovaRegularItTtf: RswiftResources.FileResource { .init(name: "ProximaNova-RegularIt", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `ProximaNova-Semibold.ttf`.
    var proximaNovaSemiboldTtf: RswiftResources.FileResource { .init(name: "ProximaNova-Semibold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `ProximaNova-SemiboldIt.ttf`.
    var proximaNovaSemiboldItTtf: RswiftResources.FileResource { .init(name: "ProximaNova-SemiboldIt", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProDisplay-Bold.otf`.
    var sfProDisplayBoldOtf: RswiftResources.FileResource { .init(name: "SFProDisplay-Bold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProDisplay-Medium.otf`.
    var sfProDisplayMediumOtf: RswiftResources.FileResource { .init(name: "SFProDisplay-Medium", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProDisplay-Regular.otf`.
    var sfProDisplayRegularOtf: RswiftResources.FileResource { .init(name: "SFProDisplay-Regular", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProDisplay-Semibold.otf`.
    var sfProDisplaySemiboldOtf: RswiftResources.FileResource { .init(name: "SFProDisplay-Semibold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProText-Bold.otf`.
    var sfProTextBoldOtf: RswiftResources.FileResource { .init(name: "SFProText-Bold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProText-Medium.otf`.
    var sfProTextMediumOtf: RswiftResources.FileResource { .init(name: "SFProText-Medium", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProText-Regular.otf`.
    var sfProTextRegularOtf: RswiftResources.FileResource { .init(name: "SFProText-Regular", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `SFProText-Semibold.otf`.
    var sfProTextSemiboldOtf: RswiftResources.FileResource { .init(name: "SFProText-Semibold", pathExtension: "otf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `touch`.
    var touch: RswiftResources.FileResource { .init(name: "touch", pathExtension: "", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    let bundle: Foundation.Bundle

    /// Nib `EmployeeCollectionCell`.
    var employeeCollectionCell: RswiftResources.NibReferenceReuseIdentifier<EmployeeCollectionCell, EmployeeCollectionCell> { .init(name: "EmployeeCollectionCell", bundle: bundle, identifier: "EmployeeCollectionCell") }

    /// Nib `SkillTableCell`.
    var skillTableCell: RswiftResources.NibReferenceReuseIdentifier<SkillTableCell, SkillTableCell> { .init(name: "SkillTableCell", bundle: bundle, identifier: "SkillTableCell") }

    func validate() throws {

    }
  }

  /// This `_R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {

    /// Reuse identifier `EmployeeCollectionCell`.
    let employeeCollectionCell: RswiftResources.ReuseIdentifier<EmployeeCollectionCell> = .init(identifier: "EmployeeCollectionCell")

    /// Reuse identifier `SkillTableCell`.
    let skillTableCell: RswiftResources.ReuseIdentifier<SkillTableCell> = .init(identifier: "SkillTableCell")
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var addOrEditEmployee: addOrEditEmployee { .init(bundle: bundle) }
    var createAccount: createAccount { .init(bundle: bundle) }
    var employeeDetails: employeeDetails { .init(bundle: bundle) }
    var employees: employees { .init(bundle: bundle) }
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var login: login { .init(bundle: bundle) }
    var personalDetails: personalDetails { .init(bundle: bundle) }

    func addOrEditEmployee(bundle: Foundation.Bundle) -> addOrEditEmployee {
      .init(bundle: bundle)
    }
    func createAccount(bundle: Foundation.Bundle) -> createAccount {
      .init(bundle: bundle)
    }
    func employeeDetails(bundle: Foundation.Bundle) -> employeeDetails {
      .init(bundle: bundle)
    }
    func employees(bundle: Foundation.Bundle) -> employees {
      .init(bundle: bundle)
    }
    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func login(bundle: Foundation.Bundle) -> login {
      .init(bundle: bundle)
    }
    func personalDetails(bundle: Foundation.Bundle) -> personalDetails {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.addOrEditEmployee.validate()
      try self.createAccount.validate()
      try self.employeeDetails.validate()
      try self.employees.validate()
      try self.launchScreen.validate()
      try self.login.validate()
      try self.personalDetails.validate()
    }


    /// Storyboard `AddOrEditEmployee`.
    struct addOrEditEmployee: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "AddOrEditEmployee"

      var addOrEditEmployeeController: RswiftResources.StoryboardViewControllerIdentifier<AddOrEditEmployeeController> { .init(identifier: "AddOrEditEmployeeController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if addOrEditEmployeeController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'addOrEditEmployeeController' could not be loaded from storyboard 'AddOrEditEmployee' as 'AddOrEditEmployeeController'.") }
      }
    }

    /// Storyboard `CreateAccount`.
    struct createAccount: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "CreateAccount"

      var createAccountController: RswiftResources.StoryboardViewControllerIdentifier<CreateAccountController> { .init(identifier: "CreateAccountController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if createAccountController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'createAccountController' could not be loaded from storyboard 'CreateAccount' as 'CreateAccountController'.") }
      }
    }

    /// Storyboard `EmployeeDetails`.
    struct employeeDetails: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "EmployeeDetails"

      var employeeDetailsController: RswiftResources.StoryboardViewControllerIdentifier<EmployeeDetailsController> { .init(identifier: "EmployeeDetailsController", storyboard: name, bundle: bundle) }
      var skillsController: RswiftResources.StoryboardViewControllerIdentifier<SkillsController> { .init(identifier: "SkillsController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if UIKit.UIImage(named: "info-overlay-profpic", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'info-overlay-profpic' is used in storyboard 'EmployeeDetails', but couldn't be loaded.") }
        if UIKit.UIColor(named: "Text Tertiary", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'Text Tertiary' is used in storyboard 'EmployeeDetails', but couldn't be loaded.") }
        if employeeDetailsController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'employeeDetailsController' could not be loaded from storyboard 'EmployeeDetails' as 'EmployeeDetailsController'.") }
        if skillsController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'skillsController' could not be loaded from storyboard 'EmployeeDetails' as 'SkillsController'.") }
      }
    }

    /// Storyboard `Employees`.
    struct employees: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "Employees"

      var employeesController: RswiftResources.StoryboardViewControllerIdentifier<EmployeesController> { .init(identifier: "EmployeesController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if employeesController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'employeesController' could not be loaded from storyboard 'Employees' as 'EmployeesController'.") }
      }
    }

    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {
        if UIKit.UIImage(named: "employees", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'employees' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
    }

    /// Storyboard `Login`.
    struct login: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = LoginController

      let bundle: Foundation.Bundle

      let name = "Login"

      var loginController: RswiftResources.StoryboardViewControllerIdentifier<LoginController> { .init(identifier: "LoginController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if UIKit.UIImage(named: "employees", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'employees' is used in storyboard 'Login', but couldn't be loaded.") }
        if loginController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'loginController' could not be loaded from storyboard 'Login' as 'LoginController'.") }
      }
    }

    /// Storyboard `PersonalDetails`.
    struct personalDetails: RswiftResources.StoryboardReference {
      let bundle: Foundation.Bundle

      let name = "PersonalDetails"

      var personalDetailsController: RswiftResources.StoryboardViewControllerIdentifier<PersonalDetailsController> { .init(identifier: "PersonalDetailsController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if personalDetailsController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'personalDetailsController' could not be loaded from storyboard 'PersonalDetails' as 'PersonalDetailsController'.") }
      }
    }
  }
}