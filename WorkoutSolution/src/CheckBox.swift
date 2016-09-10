import UIKit

class CheckBox: UIButton {
	var checkedImage = UIImage(named: "check2")
	var unCheckedImage = UIImage(named: "check1")

	var checked:Bool = false

	func isChecked() -> Bool {
		return checked
	}

	func isChecked(value: Bool) {
		checked = value
		updateImage()
	}

	func SetCheckedImange(named: String) {
		if named != "" {
			checkedImage = UIImage(named: named)
		}
	}

	func SetUncheckedImange(named: String) {
		if named != "" {
			unCheckedImage = UIImage(named: named)
		}
	}

	func updateImage() {
		if checked == true {
			self.setImage(checkedImage, forState: .Normal)
		} else {
			self.setImage(unCheckedImage, forState: .Normal)
		}
	}

	func buttonClicked(sender:UIButton, key: String) {
		if sender == self {
			checked = !checked
			let userDefaults = UserDefaults()
			userDefaults.SetBool(key, value: checked)
		}
		updateImage()
	}
}