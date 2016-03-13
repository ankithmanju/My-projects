namespace Data_Logger_GUI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.JPEG_Compression_Combobox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.Store_Images_textbox = new System.Windows.Forms.TextBox();
            this.Save_at = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.folderBrowserDialog2 = new System.Windows.Forms.FolderBrowserDialog();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.Run_Logger_Btn = new System.Windows.Forms.Button();
            this.Exit_btn = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.Recodingspeed_combobox = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)(((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic) 
                | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(82, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(314, 33);
            this.label1.TabIndex = 0;
            this.label1.Text = "Data Logger Application";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(30, 84);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 19);
            this.label2.TabIndex = 1;
            this.label2.Text = "Select Resolution";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "320*240",
            "800*600",
            "1280*720"});
            this.comboBox1.Location = new System.Drawing.Point(190, 84);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 2;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(30, 135);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(135, 19);
            this.label3.TabIndex = 3;
            this.label3.Text = "JPEG compression ";
            // 
            // JPEG_Compression_Combobox
            // 
            this.JPEG_Compression_Combobox.FormattingEnabled = true;
            this.JPEG_Compression_Combobox.Items.AddRange(new object[] {
            "100",
            "95",
            "70",
            "60",
            "50",
            "40",
            "30",
            "20",
            "10"});
            this.JPEG_Compression_Combobox.Location = new System.Drawing.Point(190, 135);
            this.JPEG_Compression_Combobox.Name = "JPEG_Compression_Combobox";
            this.JPEG_Compression_Combobox.Size = new System.Drawing.Size(121, 21);
            this.JPEG_Compression_Combobox.TabIndex = 4;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(30, 208);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(114, 19);
            this.label4.TabIndex = 5;
            this.label4.Text = "Store Images In:";
            // 
            // Store_Images_textbox
            // 
            this.Store_Images_textbox.Location = new System.Drawing.Point(190, 207);
            this.Store_Images_textbox.Name = "Store_Images_textbox";
            this.Store_Images_textbox.Size = new System.Drawing.Size(121, 20);
            this.Store_Images_textbox.TabIndex = 6;
            this.Store_Images_textbox.Text = "D:\\mypic";
            // 
            // Save_at
            // 
            this.Save_at.Location = new System.Drawing.Point(344, 204);
            this.Save_at.Name = "Save_at";
            this.Save_at.Size = new System.Drawing.Size(119, 23);
            this.Save_at.TabIndex = 7;
            this.Save_at.Text = "Save At";
            this.Save_at.UseVisualStyleBackColor = true;
            this.Save_at.Click += new System.EventHandler(this.Save_at_Click);
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radioButton2.Location = new System.Drawing.Point(190, 239);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(151, 23);
            this.radioButton2.TabIndex = 11;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "Show Video Stream";
            this.radioButton2.UseVisualStyleBackColor = true;
            this.radioButton2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
            // 
            // Run_Logger_Btn
            // 
            this.Run_Logger_Btn.Location = new System.Drawing.Point(44, 268);
            this.Run_Logger_Btn.Name = "Run_Logger_Btn";
            this.Run_Logger_Btn.Size = new System.Drawing.Size(121, 23);
            this.Run_Logger_Btn.TabIndex = 12;
            this.Run_Logger_Btn.Text = "Run Logger";
            this.Run_Logger_Btn.UseVisualStyleBackColor = true;
            this.Run_Logger_Btn.Click += new System.EventHandler(this.Run_Logger_Btn_Click);
            // 
            // Exit_btn
            // 
            this.Exit_btn.Location = new System.Drawing.Point(222, 268);
            this.Exit_btn.Name = "Exit_btn";
            this.Exit_btn.Size = new System.Drawing.Size(119, 23);
            this.Exit_btn.TabIndex = 13;
            this.Exit_btn.Text = "Exit";
            this.Exit_btn.UseVisualStyleBackColor = true;
            this.Exit_btn.Click += new System.EventHandler(this.Exit_btn_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(30, 171);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(115, 19);
            this.label5.TabIndex = 14;
            this.label5.Text = "Recording Speed";
            // 
            // Recodingspeed_combobox
            // 
            this.Recodingspeed_combobox.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.Recodingspeed_combobox.FormattingEnabled = true;
            this.Recodingspeed_combobox.Items.AddRange(new object[] {
            "0.2",
            "0.5",
            "1",
            "5",
            "10",
            "30"});
            this.Recodingspeed_combobox.Location = new System.Drawing.Point(190, 171);
            this.Recodingspeed_combobox.Name = "Recodingspeed_combobox";
            this.Recodingspeed_combobox.Size = new System.Drawing.Size(121, 21);
            this.Recodingspeed_combobox.TabIndex = 15;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(317, 174);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(97, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Frames per second";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(516, 399);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.Recodingspeed_combobox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.Exit_btn);
            this.Controls.Add(this.Run_Logger_Btn);
            this.Controls.Add(this.radioButton2);
            this.Controls.Add(this.Save_at);
            this.Controls.Add(this.Store_Images_textbox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.JPEG_Compression_Combobox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox JPEG_Compression_Combobox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox Store_Images_textbox;
        private System.Windows.Forms.Button Save_at;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog2;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.Button Run_Logger_Btn;
        private System.Windows.Forms.Button Exit_btn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox Recodingspeed_combobox;
        private System.Windows.Forms.Label label6;
    }
}

