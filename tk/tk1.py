import Tkinter as tk

root = tk.Tk()
label = tk.Label(root, text="Nathan Rulez!")
button = tk.Button(root, text="Press to vote for Nathan")
label.pack()
button.pack()
root.mainloop()