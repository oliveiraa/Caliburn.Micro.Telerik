using System.ComponentModel.Composition;
using Caliburn.Micro;

namespace Telerik.Examples.RadWindowManager
{
	[Export(typeof (IShell))]
	public class ShellViewModel : IShell
	{
		private readonly IWindowManager windowManager;

		[ImportingConstructor]
		public ShellViewModel(IWindowManager windowManager)
		{
			this.windowManager = windowManager;
		}

		public void ShowDialog()
		{
			var dialog = new DialogViewModel();
			windowManager.ShowDialog(dialog);
		}
	}
}