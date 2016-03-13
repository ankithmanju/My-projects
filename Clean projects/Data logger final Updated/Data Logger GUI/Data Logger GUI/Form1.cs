using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;

namespace Data_Logger_GUI
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Save_at_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog openfiledialog = new FolderBrowserDialog();
            DialogResult result = openfiledialog.ShowDialog(); // Show the dialog.
            if (result == DialogResult.OK)
            {
                Store_Images_textbox.Text = openfiledialog.SelectedPath; // append the path into the textbox
            }
        }

        private void Exit_btn_Click(object sender, EventArgs e)
        {
            Application.Exit(); // exit from the application

        }

        private void Run_Logger_Btn_Click(object sender, EventArgs e)
        {
            
            string path = "Default.txt";

            using (StreamWriter sw = File.CreateText(path))
            {
                if (comboBox1.Text == "1280*720")
                {
                    sw.WriteLine("1280");
                    sw.WriteLine("720");
                }
                if (comboBox1.Text == "800*600")
                {
                    sw.WriteLine("800");
                    sw.WriteLine("600");
                }
                if (comboBox1.Text == "320*240")
                {
                    sw.WriteLine("320");
                    sw.WriteLine("240");
                }
                sw.WriteLine(JPEG_Compression_Combobox.Text);
                sw.WriteLine(Store_Images_textbox.Text);
                if (radioButton2.Checked)
                {
                    sw.WriteLine("1");
                }
                else
                {
                    sw.WriteLine("0");
                }
                sw.WriteLine(Recodingspeed_combobox.Text);
                sw.Flush();
                sw.Close();

                //ProcessStartInfo startInfo = new ProcessStartInfo();
                //startInfo.FileName = "MyNewOpenCv.EXE";
                //startInfo.Arguments = f;
                //Process.Start(startInfo);
                System.Diagnostics.Process.Start("MyNewOpenCv.exe");
            }
        }

        static void main(string[] args)
        {
            string path = @"/Default.txt";
            if (!File.Exists(path))
            {
                StreamWriter sw = File.CreateText(path);
            }
            
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            using (StreamReader sr = new StreamReader("Default.txt"))
            {
                string line;
                int i = 0;
                
                // Read and display lines from the file until 
                // the end of the file is reached. 
                while ((line = sr.ReadLine()) != null)
                {
                    if (i == 0)
                        comboBox1.SelectedText = line;
                    else if (i == 1)
                        comboBox1.SelectedText =comboBox1.SelectedText+'*'+ line;
                        //JPEG_Compression_Combobox.SelectedText = line;
                    else if (i == 2)
                        JPEG_Compression_Combobox.SelectedText = line;
                        
                    else if (i == 3)
                        Store_Images_textbox.Text = line;
                    else if (i == 4)
                    {
                        if (line == "1")
                            radioButton2.Select();
                    }
                    else if (i == 5)
                        Recodingspeed_combobox.SelectedText = line;
                    i++;
                    
                }
            }

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        

        
        

        

      
      
    }
}
