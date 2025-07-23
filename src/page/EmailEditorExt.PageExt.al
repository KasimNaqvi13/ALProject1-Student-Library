pageextension 50000 "Email Editor Ext" extends "Email Editor"
{
    layout
    {
        addlast("Email Inner Details")
        {
            usercontrol(SpeechControl; SpeechToTextAddin)
            {
                ApplicationArea = All;

                trigger OnSpeechRecognized(Text: Text)
                begin
                    // RecognizedText := RecognizedText + ' ' + Text;
                    RecognizedText := Text;
                    CurrPage.Update(false);
                end;

            }
            field("Email Editors"; EmailBodytext)
            {
                Caption = 'custom addin message';
                ApplicationArea = All;
                ToolTip = 'Specifies the content of the email.';
                MultiLine = true;
                ExtendedDatatype = RichContent;

                trigger OnValidate()
                begin
                    // EmailMessageImpl.SetBody(EmailBodytext);
                    // EmailMessageImpl.Modify();
                end;
            }
        }
    }
    actions
    {
        addafter(ShowSourceRecord)
        {
            action(StartRecording)
            {
                Caption = 'Start Recording';
                Tooltip = 'Start recording speech input.';
                Image = Start;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SpeechControl.StartRecording();
                end;
            }

            action(StopRecording)
            {
                Caption = 'Stop Recording';
                Tooltip = 'Stop recording speech input.';
                Image = Stop;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    CurrPage.SpeechControl.StopRecording();
                    EmailBodytext := RecognizedText;
                    Message('Recognized Text: %1', RecognizedText);
                    Message(EmailBodytext);
                end;
            }
        }
        addlast(Promoted)
        {
            group(recordings)
            {
                Caption = 'Recordings';
                ShowAs = SplitButton;
                actionref(StartRecordings; StartRecording) { }
                actionref(StopRecordings; StopRecording) { }
            }
        }
    }

    var
        RecognizedText: Text;
        EmailBodytext: Text;
}
