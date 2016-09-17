import UIKit

class CheckBox: UIButton {
	var checkedImage = UIImage(named: "check2")
	var unCheckedImage = UIImage(named: "check1")

	var checked:Bool = false

	func isChecked() -> Bool {
		return checked
	}

	func isChecked(_ value: Bool) {
		checked = value
		updateImage()
	}

	func SetCheckedImange(_ named: String) {
		if named != "" {
			checkedImage = UIImage(named: named)
		}
	}

	func SetUncheckedImange(_ named: String) {
		if named != "" {
			unCheckedImage = UIImage(named: named)
		}
	}

	func updateImage() {
		if checked == true {
			self.setImage(checkedImage, for: UIControlState())
		} else {
			self.setImage(unCheckedImage, for: UIControlState())
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
