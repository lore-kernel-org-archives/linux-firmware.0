Return-Path: <SRS0=GZvX=2V=chime-notifications-apps.bounces.google.com=34QeXaAgUAJgFG-J6HDQ4D2KKJGGE.8GG8D6.4GE@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB8C87FCB
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Aug 2025 08:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93155C4CEF6; Sat,  9 Aug 2025 08:33:39 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1FB2C4CEE7
	for <linux-firmware@kernel.org>; Sat,  9 Aug 2025 08:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1FB2C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=classroom.google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chime-notifications-apps.bounces.google.com
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e826e0d7abso539382385a.0
        for <linux-firmware@kernel.org>; Sat, 09 Aug 2025 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754728417; x=1755333217; darn=kernel.org;
        h=to:from:subject:message-id:date:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=37f77meS1UyWz+298rYoZDqZXjkd+DFAQ+pplfilNno=;
        b=Ak29rXoGoJah4Km1JPalRCQpKoRaLcVciCNm4MTX6GzKExb5DZLT5P/N2JDu9Q+GkQ
         dxMPTRtWHQ4nYvrPfkRsKhONUCicM/x9f1jyf7Cz0k0mpTYkvyPCQXFkQopW/SeVwvae
         mSxeiiGpiwyzqb5t2hNJPaaXrLw//kItFADh0hoMqD1qFwWU9OXSpXSUX7WbS5PLGHOb
         YavYOIoZZm90WQPtj5fst7LA0YfMjvyV8dedSEeFW5PKAiInUSfN4nZQpPZ6EM8ZWTMS
         UmJW7OBBg75V/zUNkGJC6pV3AZYa9R06h9K7EvZ8ODM/+JkjeiXp2DUZ9w0lxL43rgl3
         vGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728417; x=1755333217;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37f77meS1UyWz+298rYoZDqZXjkd+DFAQ+pplfilNno=;
        b=r8wu3w0rbcpTxF7TbV1ZapKdAbUvbIe7QFt2X4i3mfzF2z2gHNvDeqLckNkNBen1al
         7a8UGUBj0wVQq/C69s/0kODiQDJvEHX61Ta7Z85iDuSnPm3fRvxMCpTLfCjvIcQt5ih4
         xEGONpz5gkKTHgNb1vJ8x887tq9lF/Bh8gEQ6xuuBNSw5QfJakSfWKS0dnPPZ0s3qnQa
         2/zLCdtV+DUmEtiyDccQ/jVbfJ4OV5UkY29Chq16S1ruBZQhG8V8cnM4Xnqoe3SEOEuu
         kDB4nTDxVIlZ9A3vtuTw6GJYMCfSh+xDTrJbyqBl0DN24Pc8Z17morRJvsZ8QWZIeDo0
         xqcA==
X-Gm-Message-State: AOJu0Yx+9Tq8t9pcxtn6FlSj9/GB5PkU6tuN79r0HYYrqYQm7PC6CA1m
	rGc4ecUazYuTdVoMsudeYirVZixIoX1/gR/p/CsOLyqterFh/6/jSnViSd5PufnJexX79h9MhcR
	7hBkIXHxY60Mx6bVSJIAF719H/gciB+3q0RF+C0GXk51DqUEr1BWyXJZero5wvAQ=
X-Google-Smtp-Source: AGHT+IFcY3tqIKZao6wfRbJBGaYwFLLfBZ5zHJuh37Skzvq7+nSY9JJJ7FMfvb4XhzzyZdkBde5DNoklFZHbahl5A8iiwzw/ui8=
MIME-Version: 1.0
X-Received: by 2002:ac8:6909:0:b0:4b0:7372:1bcb with SMTP id
 d75a77b69052e-4b0aed42416mr73244371cf.15.1754728417514; Sat, 09 Aug 2025
 01:33:37 -0700 (PDT)
Date: Sat, 09 Aug 2025 01:33:37 -0700
X-Notifications: COURSE_INVITATION:791526738434-1754728417229
X-Notifications-Bounce-Info: AWoTSIGY02rxlstwbQfX-dY4gIPfnwSMceeoQgO9ACo8qT0wUZhBujhqED7BR9rNoA84PyYpesH9N3gzllujfcKdqC8YXgyOzW191xW9pQa-1gwzkVX0G1UVlhIHie0IdyXjeAEvCfQpFefe10aF8EB-yQpPU48y4fU2r3awDCvRUTJXg3njGMfPygdH2EerOdPehteMBwUI3YJNTbw5WBE8vrb_vGRyKAJv3R3ObRig3_DgyUg2XW1P1W9wDG-jCzFfvwyvALyE0nBLdHgNjAwNjA0MDQxNTM1NTk2OTMzMg
Message-ID: <UHjgGj0MfyN_Acn-ZhDAXA@notifications.google.com>
Subject: Class invitation: "vhm3pzkag2 Please send Us your full offer on our
 whatsapp +48 732 672 824 We are interested on big orders for our clients."
From: "Maddison Simon (Classroom)" <no-reply@classroom.google.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000000da6d063bea8c6a"

--00000000000000da6d063bea8c6a
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes


Maddison Simon
maddisonsimon@integratie-inburgering.org
Invited you to join vhm3pzkag2 Please send Us your full offer on our  
whatsapp +48 732 672 824 We are interested on big orders for our clients.
Join class  
<https://accounts.google.com/AccountChooser?continue=https://classroom.google.com/invite/accept_token/NzkxNTI2NzM4NDM0?role%3D3%26t%3Dfosuybbezwk3fnr7%26email%3Dlinux-firmware@kernel.org&Email=linux-firmware@kernel.org>
If you accept, your contact information will be shared with the class  
members and applications they authorize to use Classroom. Learn more  
<https://support.google.com/edu/classroom/answer/6386395>
Forward to only those you trust. Anyone with this email may be able to  
accept the invitation.

Google LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043 USA

--00000000000000da6d063bea8c6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><link href=3Dhttps://fonts.googleapis.com/css?family=3DRoboto:4=
00,500,700,bold|Google+Sans:400,500,700,bold rel=3Dstylesheet><style>@media=
 (forced-colors: active) and (prefers-color-scheme: dark){.classroomTitleDa=
rk{content: url("https://www.gstatic.com/classroom/email/classroom_type_whi=
te.png");}}</style></head><body style=3D"font-family: Roboto,Helvetica,Aria=
l,sans-serif; margin: 0; padding: 0; background-color: #FFFFFF"><img src=3D=
"https://notifications.googleapis.com/email/t/AFG8qyUVYDVGfyAF-w_7-LylMpDz0=
TWsAB6rbkvv4nvVSqIR-d8loox5tls2DyOjHNC3VlvoGLj-_t6IzPrZQQrpbVcgtPcYP4oTEZN7=
SNqHQCrd5lWzRESfOTLWFwjicqij448DDUPE6zZdaEpRqaYWxRtaqO1HjWoluRE7e3IDpZ6ock_=
SMTCh6pyZG5bIr0kSyimpMNKbMCsI6ZH4fH960yV2HC25tD94fXXFFDbGoPC1BJJeFJgiiSCXGB=
so3Y9Q-CLd4WcaJRjMvBEb7efNQfuE6tpT4mJKIpQxxOWQrYfVszxw6nnam115mhDlppluUnmlb=
Nvpt0Tb7p4noA0ij-wxrbtM/a.gif" width=3D1 height=3D1><!--[if mso]><style>bod=
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
ercontent.com/a/ACg8ocL23N_CN71eaG8I8luHq_IKNhg6mdjPkKJYTsLOBgtWKpXy1w=3Ds7=
2-mo"/></v:oval><![endif]--><div style=3Dmso-hide:all;><img alt=3D"" aria-h=
idden=3Dtrue src=3Dhttps://lh3.googleusercontent.com/a/ACg8ocL23N_CN71eaG8I=
8luHq_IKNhg6mdjPkKJYTsLOBgtWKpXy1w=3Ds72-mo height=3D40 width=3D40 style=3D=
"border-radius: 50%;height: 40px; width: 40px;padding: 0px;" role=3Dpresent=
ation></div></td></tr><tr><td align=3Dcenter style=3D"font-family: Google S=
ans,Roboto,Helvetica,Arial,sans-serif;font-size:14px;font-size:0.88rem;font=
-weight: 500; letter-spacing: 0.25px;line-height:20px;line-height:1.25rem;c=
olor: #3C4043; padding-top: 4px;">Maddison Simon</td></tr><tr><td align=3Dc=
enter style=3D"font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12p=
x;font-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:16p=
x;line-height:1.00rem;color: #5F6368; padding-top: 4px;">maddisonsimon@inte=
gratie-inburgering<span>.</span>org</td></tr><tr><td align=3Dcenter style=
=3D"font-family: Google Sans,Roboto,Helvetica,Arial,sans-serif;font-size:18=
px;font-size:1.13rem;font-weight: 400; letter-spacing: 0;line-height:24px;l=
ine-height:1.50rem;color: #000000; padding-top: 32px;">Invited you to join =
vhm3pzkag2 Please send Us your full offer on our whatsapp +48 732 672 824 W=
e are interested on big orders for our clients<span>.</span></td></tr><tr><=
td align=3Dcenter style=3D"padding: 24px 0 8px 0; "><table cellpadding=3D0 =
cellspacing=3D0 dir=3Dltr role=3Dpresentation><tr><td style=3D"border: 1px =
solid #DADCE0;border-radius: 4px; padding: 8px 24px;"><a href=3D"https://no=
tifications.googleapis.com/email/redirect?t=3DAFG8qyVV4laEgIaQNh7H6AYAajFVZ=
e_wd6WA3ZzJhhMm5Ekg0Z1sYLH2jQnjuBhTQ1ZqC7KnjPMJ6HqlE797Nt5Pmy4uZjqOamcWF-g7=
Jzysm-sveEJpKVdWWQs_6lL7zMxqqn5sAu2Fopd1FILJrCfeQFPjpI4wyysQpY4xPKvf32YCShq=
N1Fqq71eIy-STcauQ9xxjQed-Xp7oXX2x10RO6a1O7Fks6tgg2BssQt9StS5ac4Ikz77Ba7Ebu_=
HaRrNu3CCwU1M_KUVNHAHkAMFvSpWCw9IkXg3CV-8EgUt-rcOc16pwZLcsXczHLkWmTg&amp;r=
=3DeJx1jbsOgjAUhp9GN6kBo4kJQSMODnRyN6U5QNPLIe1BkKe3RAcXpz_5_ltH1IcjY0JKHByF=
pEVsDSQSLTt_2KVDDOALiY6UGyDvvh1pRAge0f6WlHsqgmUPenoQanCMz3ri91vK52rHy2pbeDS=
wyspsle4paoNheNU1zKPOGucPEYMVykTLxMdp0yhvR-HhpME7MAn6dn1dEvlf_w0_CE_8&amp;s=
=3DALHZ2r4Kv09PIHs8zMCk7USAtV2n" style=3D"font-family: Google Sans,Roboto,H=
elvetica,Arial,sans-serif;font-size:14px;font-size:0.88rem;font-weight: 500=
; letter-spacing: 0.25px;line-height:20px;line-height:1.25rem;color: #1967d=
2; text-decoration: none;" target=3D_blank>Join class</a></td></tr></table>=
</td></tr></table></td></tr></table></td></tr><tr><td align=3Dcenter style=
=3D"font-family: Roboto,Helvetica,Arial,sans-serif;font-size:12px;font-size=
:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:16px;line-heig=
ht:1.00rem;color: #5F6368; padding: 24px 32px 0;">If you accept, your conta=
ct information will be shared with the class members and applications they =
authorize to use Classroom. <a href=3D"https://notifications.googleapis.com=
/email/redirect?t=3DAFG8qyVZDhK_eTkdgBXP1DK-Dnv9SdZE-bQSVkiPGNSSLfbNZYyDYDZ=
Ka4pZAqdQuWIhnfM9rs1MJbTWYBdZCi34F0kbtnT8j62Rx3XrAExIMCLYy1AWq_-7z0OfdBgksO=
K0mLB2OACTvSmwgL7QmVxzZd1NMkTUOML14-ALKYgDZlAvVfYhvhBJR6RIREP69sYBigTKm8pRy=
m66hGhTsvAeEJIrMcFj50LX5xBULThwQMJTsi_p9dA78sh2Hb1JAXlUQxRS3uT93dW-PGC76PuV=
5bBUuYEZTFOtYXr9Tw3VfOlD6gXpfAZzgNNrYWM&amp;r=3DeJzLKCkpKLbS1y8uLSjILyrRS8_=
PT89J1UvOz9VPTSnVT85JLC4uygfyEvOKy1OL9M2MLcyMLU0BSIwT1g&amp;s=3DALHZ2r7V4ZZ=
KM_v0ZM_xe7aZRK36" target=3D_blank style=3D"color: #1967d2; font-weight: 40=
0; text-decoration: none; font-family: Roboto,Helvetica,Arial,sans-serif;fo=
nt-size:12px;font-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line=
-height:16px;line-height:1.00rem;color: #1967d2;">Learn more</a></td></tr><=
tr><td align=3Dcenter style=3D"font-family: Roboto,Helvetica,Arial,sans-ser=
if;font-size:12px;font-size:0.75rem;font-weight: 400; letter-spacing: 0.3px=
;line-height:16px;line-height:1.00rem;color: #5F6368; padding: 12px 32px 0;=
">Forward to only those you trust. Anyone with this email may be able to ac=
cept the invitation.</td></tr></table></td></tr><tr><td><div style=3D"float=
: left; margin-right: 12px;"><img alt=3D"Google logo" src=3Dhttps://www.gst=
atic.com/classroom/email/google_logo_grey700.png height=3D26 width=3D64></d=
iv><div style=3D"font-family: Roboto,Helvetica,Arial,sans-serif;font-size:1=
2px;font-size:0.75rem;font-weight: 400; letter-spacing: 0.3px;line-height:1=
6px;line-height:1.00rem;color: #5F6368; width: 80%; float: left; margin-top=
: 4px;">Google LLC 1600 Amphitheatre Parkway, Mountain View, CA 94043 USA</=
div></td></tr></tbody></table></td></tr><!--[if mso]></td></tr></table><![e=
ndif]--></table></body></html>
--00000000000000da6d063bea8c6a--
