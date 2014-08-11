#
# Be sure to run `pod lib lint ASPriorityQueue.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ASPriorityQueue"
  s.version          = "0.1.0"
  s.summary          = "This package is designed to be a priority queue that takes in a type and comparator"
  s.homepage         = "https://github.com/astephen2/ASPriorityQueue"
  s.license          = 'MIT'
  s.author           = { "Alex Stephen" => "stepa@umich.edu" }
  s.source           = { :git => "https://github.com/astephen2/ASPriorityQueue.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'ASPriorityQueue/'

end
