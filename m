Return-Path: <SRS0=3R25=2Y=chime-notifications-apps.bounces.google.com=3RTSbaAgUAGYRS-VITPcGPEWWVSSQ.KSSKPI.GSQ@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2552C87FCB
	for <linux-firmware@archiver.kernel.org>; Tue, 12 Aug 2025 12:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0FF6C4CEF4; Tue, 12 Aug 2025 12:32:07 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFC30C4CEF0
	for <linux-firmware@kernel.org>; Tue, 12 Aug 2025 12:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFC30C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=classroom.google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chime-notifications-apps.bounces.google.com
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06a73b580so79428671cf.1
        for <linux-firmware@kernel.org>; Tue, 12 Aug 2025 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755001925; x=1755606725; darn=kernel.org;
        h=to:from:subject:message-id:date:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0c+dScXE50aOlmLf7VtYJRlG1tcrRMYMs3R5tqAEMRg=;
        b=f+zbfoaRp8eejyNoRf9OqUphlBE7AABQkgDJX3yt/R66ip7CylQ9+NO8TYmy+OznT9
         VJ74s2mZ2jPCJc11/GzMXTQxYIFRh9ROWBaTFqBi1KYRBbGCH6+YwF6PVYZA2g9j1GUm
         KjnQaMcMBkCBmhIeMCn2Rm0vIMNUkgTGv9bt5VKjhjhqnJci0f1iP5VOH7lG0tjzpr8U
         zf0GNVCRRGWZihc2nNk/bg7XhnIK8fR2H8jwWF7l2NMgb5Ll6SwKqmwBKAZQwFkwjxkP
         lWikLfYNrGZgV7NM/Bwrsynq+giz75vfQfOE1JEmZaHWNX2LcOMSbaVHKmsCov9l63G2
         4VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755001925; x=1755606725;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0c+dScXE50aOlmLf7VtYJRlG1tcrRMYMs3R5tqAEMRg=;
        b=PriITbD+ONApvreH+dv64nqMKAAi2idrfAMvKe0kLgorYKWUM1qtKisO5bBy4ZUXfr
         odOPN+wZ2cAezjfks6poJnSAAgLyk9tzZz1f/U32tTKzcUImYOnFrmH7G/c7RCJ6XAHR
         dxV2vwzgk7oMwLsQHemElxj2vf0XRCiYMPJEl8iE4OAFksQIaG8ux73V56NiRrrvQ4Ea
         wPsyoI4/uTw/WnsSx7E3rxKnDA8uzeR4x6Pmnac4wD+Y/smzxVVBsYpvwIj+2T6T/PwJ
         bKbJGrwdR2eGcbTYKzqWSVLPkmeglDFxwHlTdLl02DKCWv0scAcurbv8prryq18M/jcw
         npdQ==
X-Gm-Message-State: AOJu0YynUar5M0lYguLkKDrIEVhgZgkbeDXZ6X+UoXXi2WY5I47vyjcy
	jVu4bXC7J2Ym2IZ7r9T+8LlHvsTw10SLzcaIJzLXCkC2qrac13+O+HTINx+87XPcqFsBq8MfZyN
	h3pAm4DFUkT4ZNypn/cgsF7jyCs1cuMKK7nCVuWVuW55wV7K0roXiKgm0v2jc1HQ=
X-Google-Smtp-Source: AGHT+IHy4MMShWVFXclOm80FeSYJw9UOxD3WDVtkgsAES+bQFd9PVs5P0MKuGKkKg5arDYCfn/n9dQVWBrb4sI2s9dLzL8sDd7o=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:130a:b0:4b0:e034:f108 with SMTP id
 d75a77b69052e-4b0eca9a317mr38552801cf.30.1755001925401; Tue, 12 Aug 2025
 05:32:05 -0700 (PDT)
Date: Tue, 12 Aug 2025 05:32:05 -0700
X-Notifications: COURSE_INVITATION:791804184921-1755001924962
X-Notifications-Bounce-Info: AWoTSIEnLUvbsS_MrRrBHCojO-Ij9VKHRX-RdbEDGubiC-_ar3Jq6LYpZpIPQnVBDxA6AjmR-2AmjH8Tk5cNhTwGR_dVi0mv4isVsyt803_s0TkFj2bGrfSZUg8TN_xI-WHveKswF78XDPiRxtVRp5nnnITjkkUCs2KTzALrasA_H_fupTYojfA431QioBwyUW6tTeMva1NcxOvU4ILJpSzO6NWgJd9a_xtuK6JPJGYr5BB42eMl-pcOjAvRS8tclprHyrDoj_JiQGXM_F4NjAwNjA0MDQxNTM1NTk2OTMzMg
Message-ID: <wWNbgCGNNZaEDOqylrbAsw@notifications.google.com>
Subject: =?UTF-8?Q?Class_invitation=3A_=22vtlky10vm5_sDFs342_Hello=2C_we_are_?=
	=?UTF-8?Q?looking_for_a_supplier_whose_products_we_can_resell=2E_If_you?=
	=?UTF-8?Q?=E2=80=99re_interested_in_working_together=2C_please_contact_us_on_W?=
	=?UTF-8?Q?hatsApp_at_=2B48_507_951_880=22?=
From: "Lylah Carey (Classroom)" <no-reply@classroom.google.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000581558063c2a3aee"

--000000000000581558063c2a3aee
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

DQpMeWxhaCBDYXJleQ0KbHlsYWhjYXJleUBpbnRlZ3JhdGllLWluYnVyZ2VyaW5nLm9yZw0KSW52
aXRlZCB5b3UgdG8gam9pbiB2dGxreTEwdm01IHNERnMzNDIgSGVsbG8sIHdlIGFyZSBsb29raW5n
IGZvciBhIHN1cHBsaWVyICANCndob3NlIHByb2R1Y3RzIHdlIGNhbiByZXNlbGwuIElmIHlvdeKA
mXJlIGludGVyZXN0ZWQgaW4gd29ya2luZyB0b2dldGhlciwgIA0KcGxlYXNlIGNvbnRhY3QgdXMg
b24gV2hhdHNBcHAgYXQgKzQ4IDUwNyA5NTEgODgwDQpKb2luIGNsYXNzICANCjxodHRwczovL2Fj
Y291bnRzLmdvb2dsZS5jb20vQWNjb3VudENob29zZXI/Y29udGludWU9aHR0cHM6Ly9jbGFzc3Jv
b20uZ29vZ2xlLmNvbS9pbnZpdGUvYWNjZXB0X3Rva2VuL056a3hPREEwTVRnME9USXg/cm9sZSUz
RDMlMjZ0JTNEZjdld3o0Nzd0ZG1pd2RmNSUyNmVtYWlsJTNEbGludXgtZmlybXdhcmVAa2VybmVs
Lm9yZyZFbWFpbD1saW51eC1maXJtd2FyZUBrZXJuZWwub3JnPg0KSWYgeW91IGFjY2VwdCwgeW91
ciBjb250YWN0IGluZm9ybWF0aW9uIHdpbGwgYmUgc2hhcmVkIHdpdGggdGhlIGNsYXNzICANCm1l
bWJlcnMgYW5kIGFwcGxpY2F0aW9ucyB0aGV5IGF1dGhvcml6ZSB0byB1c2UgQ2xhc3Nyb29tLiBM
ZWFybiBtb3JlICANCjxodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9lZHUvY2xhc3Nyb29tL2Fu
c3dlci82Mzg2Mzk1Pg0KRm9yd2FyZCB0byBvbmx5IHRob3NlIHlvdSB0cnVzdC4gQW55b25lIHdp
dGggdGhpcyBlbWFpbCBtYXkgYmUgYWJsZSB0byAgDQphY2NlcHQgdGhlIGludml0YXRpb24uDQoN
Ckdvb2dsZSBMTEMgMTYwMCBBbXBoaXRoZWF0cmUgUGFya3dheSwgTW91bnRhaW4gVmlldywgQ0Eg
OTQwNDMgVVNBDQo=
--000000000000581558063c2a3aee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><link href=3Dhttps://fonts.googleapis.com/css?family=3DRoboto:4=
00,500,700,bold|Google+Sans:400,500,700,bold rel=3Dstylesheet><style>@media=
 (forced-colors: active) and (prefers-color-scheme: dark){.classroomTitleDa=
rk{content: url("https://www.gstatic.com/classroom/email/classroom_type_whi=
te.png");}}</style></head><body style=3D"font-family: Roboto,Helvetica,Aria=
l,sans-serif; margin: 0; padding: 0; background-color: #FFFFFF"><img src=3D=
"https://notifications.googleapis.com/email/t/AFG8qyVpW_quKpc1v8wgrSISsK6M3=
-UbKXBoVmmmAL897uzy8bZd59EKrpa-X6Vklpl5BEiOFE2QfNAtGp21oWf1Hwqf80GaAZTem6TM=
C1Yfu84LmcngQGlBXc3NZZvS_blG_IR1t_QMUE64pIXjPLZSKO2nT3WwZtdNooJgi_AK-CofNos=
JLE3FtUerpvBC4OrkdmPPUY3L5QLFpmG2PI1chR5XpFB_Of7ciNKA2XkFrnVbnJVJPB8FZ6ug9K=
Cv0Sy5Px-E_VDGl57sG5fBbsQPyvdYEFSBCbUmgUoLk7PKxDmBnQW9c9F9y4MGYnhywIyGULWCn=
ECDkoIpK2XuWOg2E4-1LONw/a.gif" width=3D1 height=3D1><!--[if mso]><style>bod=
y, table, div, ul, li, td, span, a { font-family: Helvetica, Arial, sans-se=
rif !important; }</style><![endif]--><table cellpadding=3D0 cellspacing=3D0=
 dir=3Dltr role=3Dpresentation align=3Dcenter style=3D"background-color: #F=
FFFFF; border-collapse: collapse; max-width: 632px; min-width: 256px; word-=
break: break-word; width: 100%;"><!--[if mso]><table cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" width=3D"600" style=3D"border-collapse:=
 collapse; table-width: fixed;"><tr><td><![endif]--><tr><td style=3D"paddin=
g: 16px;"><table cellpadding=3D0 cellspacing=3D0 dir=3Dltr role=3Dpresentat=
ion><tbody><tr><td style=3D"padding-bottom: 16px;"><table cellpadding=3D0 c=
ellspacing=3D0 dir=3Dltr role=3Dpresentation style=3D"background-color: #FF=
FFFF; border-collapse: collapse; max-width: 632px; min-width: 256px; backgr=
ound-color: #FFFFFF; width: 100%;" width=3D100%><tr><td><div style=3D"float=
: left;line-height:32px;line-height:2.00rem;"><img alt=3D"Classroom Logo" s=
tyle=3D"display: block; margin: 0;" height=3D32 width=3D190 src=3Dhttps://w=
ww.gstatic.com/classroom/email/classroom_text_with_logo_grey700.png></div><=
/td></tr></table></td></tr><tr><td style=3D"padding-bottom: 24px;"><table><=
tr><td><table cellpadding=3D0 cellspacing=3D0 dir=3Dltr role=3Dpresentation=
 style=3D"border: 1px solid #DADCE0; border-collapse: separate; border-radi=
us: 8px; width: 100%;"><tr><td style=3D"padding: 24px 24px 32px 24px; "><ta=
ble cellpadding=3D0 cellspacing=3D0 dir=3Dltr role=3Dpresentation style=3D"=
width: 100%;"><tr><td align=3Dcenter style=3D"font-size: 0; padding-top: 16=
px;"><!--[if mso]><v:oval xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:w=
=3D"urn:schemas-microsoft-com:office:word" style=3D"height:40px;width:40px;=
" fill=3D"t" stroke=3D"f"><v:fill type=3D"frame"src=3D"https://lh3.googleus=
ercontent.com/a/ACg8ocLk3s6aCKBiyIsqa69cFUl3Li9JK2dRjjZ51_rPP4sKl9091g=3Ds7=
2-mo"/></v:oval><![endif]--><div style=3Dmso-hide:all;><img alt=3D"" aria-h=
idden=3Dtrue src=3Dhttps://lh3.googleusercontent.com/a/ACg8ocLk3s6aCKBiyIsq=
a69cFUl3Li9JK2dRjjZ51_rPP4sKl9091g=3Ds72-mo height=3D40 width=3D40 style=3D=
"border-radius: 50%;height: 40px; width: 40px;padding: 0px;" role=3Dpresent=
ation></div></td></tr><tr><td align=3Dcenter style=3D"font-family: Google S=
ans,Roboto,Helvetica,Arial,sans-serif;font-size:14px;font-size:0.88rem;font=
-weight: 500; letter-spacing: 0.25px;line-height:20px;line-height:1.25rem;c=
olor: #3C4043; padding-top: 4px;">Lylah Carey</td></tr><tr><td align=3Dcent=
er style=3D"font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12px;f=
ont-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:16px;l=
ine-height:1.00rem;color: #5F6368; padding-top: 4px;">lylahcarey@integratie=
-inburgering<span>.</span>org</td></tr><tr><td align=3Dcenter style=3D"font=
-family: Google Sans,Roboto,Helvetica,Arial,sans-serif;font-size:18px;font-=
size:1.13rem;font-weight: 400; letter-spacing: 0;line-height:24px;line-heig=
ht:1.50rem;color: #000000; padding-top: 32px;">Invited you to join vtlky10v=
m5 sDFs342 Hello, we are looking for a supplier whose products we can resel=
l<span>.</span> If you=E2=80=99re interested in working together, please co=
ntact us on WhatsApp at +48 507 951 880</td></tr><tr><td align=3Dcenter sty=
le=3D"padding: 24px 0 8px 0; "><table cellpadding=3D0 cellspacing=3D0 dir=
=3Dltr role=3Dpresentation><tr><td style=3D"border: 1px solid #DADCE0;borde=
r-radius: 4px; padding: 8px 24px;"><a href=3D"https://notifications.googlea=
pis.com/email/redirect?t=3DAFG8qyUcB4rOXtkIlk6IseDqokbc60JxPBC1TEzyL-6N9Lhg=
t5fPj2KHEhwUf8vwNbyMY3z50MbKJClobrWGeKcVuqj89krMy2ZzWDYNVOL86LMWleZ9PLZi_pT=
rEawuLxWaTfUjIhNhYgP90UWN-wdSAj7bK8Co24w2_y_T8CUqONgcGCDBb1spOfh4V6046gvAsr=
4wRAQU7kU4mF3WoAFaUhyYUMGRI61uKDhsu423zKypxzEW3tblvnGNMpLPXlZ0HNFilOVXeoqeG=
72OcXUQ0rnFiTdfBZjAcbioZxteAn9kwNATslmVeWQCcHxWhA&amp;r=3DeJx1jb0OgjAUhZ8GN=
ykRlcSEIBEHB2VhN025lIa2l7QXITy9EB1cnE7ynb-WqPcnxrgQOFjyoUSUGkKBhuUfdmkRPbhM=
oCVlB0jbb0do7r1DNL8lZV-KYN2Dnp6EHVj2mLupLPLoXsmorG5T5lBDEBdxsDvSok0C47xPEqq=
NGuvmsGAwXOnF0svjtG2UMyN3cO7AWdAhOrm5ron0r_8GFrVPdQ&amp;s=3DALHZ2r5uTjj82XN=
HMLJRx6WSqorP" style=3D"font-family: Google Sans,Roboto,Helvetica,Arial,san=
s-serif;font-size:14px;font-size:0.88rem;font-weight: 500; letter-spacing: =
0.25px;line-height:20px;line-height:1.25rem;color: #202124; text-decoration=
: none;" target=3D_blank>Join class</a></td></tr></table></td></tr></table>=
</td></tr></table></td></tr><tr><td align=3Dcenter style=3D"font-family: Ro=
boto,Helvetica,Arial,sans-serif;font-size:12px;font-size:0.75rem;font-weigh=
t: 400; letter-spacing: 0.3px;line-height:16px;line-height:1.00rem;color: #=
5F6368; padding: 24px 32px 0;">If you accept, your contact information will=
 be shared with the class members and applications they authorize to use Cl=
assroom. <a href=3D"https://notifications.googleapis.com/email/redirect?t=
=3DAFG8qyUceFNbSoyBfY89xdOF4bTwnRTRVVXTHcaDL-ksLiNxeck6-UtW1ASA3_e7fWH7jLt6=
tfibGPaeH0c0558SXQqMIrIzeqDSbFhg16SVZbpwh6-mwroT6mjfbeNFW537eWawf5_9hstbeIR=
u-dvKo123FwGkC6WZqYwtmIFOOBatZdV5xhR11Q3SD3pg7KdVrnEIu4UTsbupUTlohFt691L-nw=
gucBuUoRwQuwJ5TLghq5s5sujxlBLTOymioPw6hbgj1aCaqLYGvt1a24nzPpHw21Vc-0E6naF5A=
VPRm9RrdF1ZGgUSj-d3UyA&amp;r=3DeJzLKCkpKLbS1y8uLSjILyrRS8_PT89J1UvOz9VPTSnV=
T85JLC4uygfyEvOKy1OL9M2MLcyMLU0BSIwT1g&amp;s=3DALHZ2r6QfYkfPEiumHaLKhx3Avkv=
" target=3D_blank style=3D"color: #202124; font-weight: 400; text-decoratio=
n: none; font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12px;font=
-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:16px;line=
-height:1.00rem;color: #202124;">Learn more</a></td></tr><tr><td align=3Dce=
nter style=3D"font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12px=
;font-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:16px=
;line-height:1.00rem;color: #5F6368; padding: 12px 32px 0;">Forward to only=
 those you trust. Anyone with this email may be able to accept the invitati=
on.</td></tr></table></td></tr><tr><td><div style=3D"float: left; margin-ri=
ght: 12px;"><img alt=3D"Google logo" src=3Dhttps://www.gstatic.com/classroo=
m/email/google_logo_grey700.png height=3D26 width=3D64></div><div style=3D"=
font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12px;font-size:0.7=
5rem;font-weight: 400; letter-spacing: 0.3px;line-height:16px;line-height:1=
.00rem;color: #5F6368; width: 80%; float: left; margin-top: 4px;">Google LL=
C 1600 Amphitheatre Parkway, Mountain View, CA 94043 USA</div></td></tr></t=
body></table></td></tr><!--[if mso]></td></tr></table><![endif]--></table><=
/body></html>
--000000000000581558063c2a3aee--
