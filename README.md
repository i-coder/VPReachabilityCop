# VPReachabilityCop
Simplest way to check your Internet connection with closures on success and failure.

## Usage

```swift

        VPReachabilityCop.checkNetworkConnection({ () -> Void in
            print("Connected")
            
            }) { () -> Void in
                print("Not connected")
        }
        
      
        let bool = VPReachabilityCop.isConnectedToNetwork()

```
