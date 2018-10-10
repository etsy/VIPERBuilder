Pod::Spec.new do |s|

  s.name         = "VIPERBuilder"
  s.version      = "2.0.0"
  s.summary      = "Scaffolding for building apps in a clean way with VIPER architecture"
  s.platform     = :ios, "8.0"
  s.source       = {
      :git => "https://github.com/etsy/VIPERBuilder.git",
      :tag => "v#{s.version}"
  }
  s.authors	 = 'Etsy'
  s.homepage	 = 'https://github.com/etsy/VIPERBuilder'
  s.source_files = "VIPERBuilder/Classes/*.{h,m,swift}"
  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }
end
