�
 TFORM_FILEINFO 0�  TPF0TForm_FileInfoForm_FileInfoLeft*TopEHelpContext�BorderIconsbiSystemMenu BorderStylebsDialogCaptionFile propertiesClientHeight� ClientWidth�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	PositionpoScreenCenter
OnActivateFormActivateOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TLabelLabel11Left
TopKWidth(HeightCaptionCreated:  TLabelLabel12LeftFTopKWidthHeightCaption(...)  TButton	Button_OKLeftTop� WidthKHeightHint#Accept changes and close dialog boxCaptionOKDefault	ModalResultTabOrderOnClickButton_OKClick  TButtonButton_CancelLeftdTop� WidthKHeightHint$Discard changes and close dialog boxCaptionCancelModalResultTabOrderOnClickButton_CancelClick  TPageControlPagesLeftTopWidth�Height� HelpContext� 
ActivePageTab_MainTabOrder  	TTabSheetTab_MainHelpContext� CaptionInformation 	TGroupBox	GroupBox1LeftTop Width�Height� TabOrder  TLabelLabel1Left
TopWidth-HeightCaption	Filename:  TLabelLabel2Left
TopKWidth/HeightCaption	&Comment:FocusControlEdit_Comment  TLabelLabel3Left
Top� Width(HeightCaptionCreated:  TLabelLabel4Left
Top� Width+HeightCaption	Modified:  TLabelLabel_CreatedLeftFTop� WidthHeightCaption(...)  TLabelLabel_ModifiedLeftFTop� WidthHeightCaption(...)  TLabelLabel5Left	Top� WidthHeightCaptionNotes:  TLabelLabel_CountLeftETop� WidthHeightCaption0Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel7Left	Top� Width(HeightCaption
File size:  TLabelLabel_FileSizeLeftETop� WidthHeightCaption(...)  TLabelLabel_FileNotFoundLeftKTopWidth� HeightCaption FILE HAS NOT BEEN SAVED ColorclRedFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor
ParentFontVisible  TLabelLabel6Left
Top-Width8HeightCaption&Description:FocusControlEdit_Description  TLabelLabel8Left
TopiWidth#HeightCaption&Format:FocusControlCombo_Format  TBevelBevel2Left
Top� Width}HeightShape	bsTopLine  TLabelLB_RTF3Left� Top� WidthHeightCaption(3)ShowAccelCharVisible  TEditEdit_FileNameLeftFTopWidthAHeightHelpContextTabStopBorderStylebsNoneColor	clBtnFaceReadOnly	TabOrder  TEditEdit_CommentLeftFTopFWidthAHeightHint#Enter optional comment for the fileHelpContext	MaxLength� TabOrder  TEditEdit_DescriptionLeftFTop(WidthAHeightHint'Enter optional description for the fileHelpContext	MaxLength� TabOrder   	TComboBoxCombo_FormatLeftFTopdWidthAHeightHint'Choose format used when saving the fileHelpContextStylecsDropDownList
ItemHeightTabOrder    	TTabSheetTab_SettingsHelpContext� CaptionSettings 	TGroupBox	GroupBox3LeftTop Width�Height� TabOrder  TBevelBevel1Left
TopAWidth}HeightShape	bsTopLine  TLabelLabel_IsReadOnlyLeftTop(Width� HeightCaptionFile was opened as Read-Only.ColorclRedFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor
ParentFont  	TCheckBoxCB_AsReadOnlyLeftTopWidthFHeightHint&In future, open this file as Read-onlyHelpContextCaption!Open this file in &Read-Only ModeTabOrder   	TCheckBoxCB_NoMultiBackupLeftTopPWidth� HeightHint0Ignore global backup level setting for this fileCaption*Do not keep &multiple backups of this fileTabOrder    	TTabSheet	Tab_IconsHelpContext� Caption
File Icons 	TGroupBox	GroupBox4LeftTop Width�Height� TabOrder  TImageImage_TrayIconLeftJTopWidth&Height&AutoSize	  TBevelBevel3Left
TopdWidth}HeightShape	bsTopLine  	TCheckBoxCB_ShowTabIconsLeftTopWidth� HeightHint(Display or hide tab images for this fileHelpContext!Caption&Show icon images on tabsTabOrder   TFilenameEditEdit_TabImgLeftTop<Width2HeightOnAfterDialogEdit_TabImgAfterDialog
DefaultExt.icnFilterTab image files|*.icnDialogOptionsofHideReadOnlyofPathMustExist DirectInputButtonWidth	NumGlyphsTabOrder  	TCheckBoxCB_TrayIconLeftTopsWidth� HeightCaption#Use custom &Tray icon for this fileTabOrder  TFilenameEditEdit_TrayIconLeftTop� Width2HeightOnAfterDialogEdit_TrayIconAfterDialogFilterIcon files (*.ico)|*.icoDialogOptionsofHideReadOnlyofPathMustExistofFileMustExist DirectInputButtonWidth	NumGlyphsTabOrder  TRadioButtonRB_TabImgDefaultLeftTop(WidthGHeightCaption&DefaultChecked	TabOrderTabStop	OnClickRB_TabImgOtherClick  TRadioButtonRB_TabImgBuiltInLeft_Top(WidthBHeightCaption	&Built inTabOrderOnClickRB_TabImgOtherClick  TRadioButtonRB_TabImgOtherLeft� Top(Width=HeightCaption&OtherTabOrderOnClickRB_TabImgOtherClick    	TTabSheetTab_PassHelpContext� CaptionSecurity 	TGroupBox	GroupBox2LeftTop Width�Height� TabOrder  TLabelLabel_ConfirmLeft
TopUWidthBHeightCaption&Confirm pass.:FocusControlEdit_Confirm  TLabel
Label_PassLeft
Top7Width:HeightCaption&Passphrase:FocusControl	Edit_Pass  TLabelLabel_MethodLeft
Top� Width.HeightCaption&Algorithm:FocusControlCombo_Method  TLabelLabel_EnterPassLeft� TopWidth� HeightCaption Enter new access passphrase ColorclHighlightFont.CharsetDEFAULT_CHARSET
Font.ColorclHighlightTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor
ParentFont  TEditEdit_ConfirmLeftUTopPWidth(HeightHint(Carefully re-enter the access passphraseHelpContext0	MaxLength� PasswordChar*TabOrder  TEdit	Edit_PassLeftUTop2Width(HeightHint%Enter access passphrase for this fileHelpContext+	MaxLength� PasswordChar*TabOrder   	TComboBoxCombo_MethodLeftUTop� Width(HeightHint(Select which encryption algorithm to useHelpContext5StylecsDropDownList
ItemHeight TabOrder  TButtonButton_SetPassLeft
TopWidth� HeightHint8Click to change access passphrase for the encrypted fileHelpContext&Caption&Set PassphraseTabOrderOnClickButton_SetPassClick  	TCheckBoxCB_HidePassLeftUTopnWidth� HeightHint!Obscure passphrase with asterisksHelpContext:Caption&Hide passphrase while typingState	cbCheckedTabOrder     TButtonButton_SystemLeftOTop� WidthKHeightHint*Displays system File Properties dialog boxCaption
S&ystem...TabOrderOnClickButton_SystemClick  TButtonButton_HelpLeft� Top� WidthKHeightCaption&HelpTabOrderOnClickButton_HelpClick  TFormPlacementFormPlacement
IniSectionInfoDlgOptions
fpPosition LeftTop�    