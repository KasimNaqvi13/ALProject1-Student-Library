page 50121 SpeechRecognitionPage
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Speech Recognition Page';
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group("Speech Output")
            {
                field("Recognized Text"; RecognizedText)
                {
                    Caption = 'Recognized Text';
                    Tooltip = 'Displays the text recognized from speech input.';
                    Width = 500;

                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = false;
                }

                usercontrol(SpeechControl; SpeechToTextAddin)
                {
                    ApplicationArea = All;

                    trigger OnSpeechRecognized(Text: Text)
                    begin
                        RecognizedText := RecognizedText + ' ' + Text;
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StartRecording)
            {
                Caption = 'Start Recording';
                Tooltip = 'Start recording speech input.';
                Image = Start;
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
                trigger OnAction()
                begin
                    CurrPage.SpeechControl.StopRecording();
                end;
            }
        }


        area(Promoted)
        {
            group(recordings)
            {
                Caption = 'Recordings';
                actionref(StartRecordings; StartRecording) { }
                actionref(StopRecordings; StopRecording) { }
            }
        }
    }
    var
        RecognizedText: Text;
}
