import UIKit

class CheckBox: UIButton {
	var checkImage = UIImage(named: "check")
	var checkedImage = UIImage(named: "checked")

	var checked:Bool = false

	func isChecked() -> Bool {
		return checked
	}

	func isChecked(_ value: Bool) {
		checked = value
		updateImage()
	}

	func SetCheckImange(_ named: String) {
		if named != "" {
			checkImage = UIImage(named: named)
		}
	}

	func SetCheckedImange(_ named: String) {
		if named != "" {
			checkedImage = UIImage(named: named)
		}
	}

	func updateImage() {
		if checked == false {
			self.setImage(checkImage, for: UIControlState())
		} else {
			self.setImage(checkedImage, for: UIControlState())
		}
	}

	func buttonClicked(_ sender:UIButton, key: String) {
		if sender == self {
			checked = !checked
			let userDefaults = UserDefaults()
			userDefaults.SetBool(key, value: checked)
		}
		updateImage()
	}
}
