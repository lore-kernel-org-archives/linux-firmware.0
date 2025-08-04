Return-Path: <SRS0=Irzl=2Q=edumachali.cl=adalynporter3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C7C87FCF
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Aug 2025 22:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9AB2C4CEF7; Mon,  4 Aug 2025 22:51:19 +0000 (UTC)
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4A72C4CEE7
	for <linux-firmware@kernel.org>; Mon,  4 Aug 2025 22:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4A72C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=edumachali.cl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=edumachali.cl
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-615a5e1b7feso2596404a12.3
        for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 15:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754347877; x=1754952677; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dbvABf7wfx4E7NOS93rz6Xuay2pfF9NOP8Kzj57STs=;
        b=U34KrTGnNCD4vOlsvZjhIdSiVY+lbRVRv6rojc369D0zT8rx3ph0hF9vSAL98CxP9F
         pHk8LVlKDXy/H2fFadC62OcqLtCmyMcwvQ+wD4FPCUZPVYuXGwP70ktMdAlw17o2l32Z
         xttY4K2lcv6muJaEef02IlO5Nu9NgHnfd9Oup8RfpxsZJHiiHjdX5jCrpEa3SfapDw2P
         ooO5fQGmJduERaUQtffOUF1Ll+eAyL9ZO+tUo4hACVYrNMkmiEE3ifSDgtlXSi1DqOxF
         9Khmd8wG2RJilcQm1Thh8WaM48Z6D2Zc2Av+nD7Hvvmf+8Q3RUQCUr5B3c7MvjwELEQw
         0CrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edumachali-cl.20230601.gappssmtp.com; s=20230601; t=1754347877; x=1754952677; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dbvABf7wfx4E7NOS93rz6Xuay2pfF9NOP8Kzj57STs=;
        b=q4R7iVJotkWbDsxudc7MGbqhSghkgsfGBDWbLAZilwEVCcwQXlanbSa5U88NxyB6gn
         VQSLV7dS0RlFeRrHhfolv9qdkpYeGmyN09K63qs2ybXFzeAP6CRk/Ii1Y8HDWU3Prdr/
         0r66BWptnqnDDb3GkAvOHkA8e6YEd5JuKw/mCEih50vJu/fysxAMLf1Qb3s3pKyrqQAn
         vnxnSaJd30/y7SBRi0bi833RKrXFoeN83zlGMpDvKPfWM5zGH86psVQB60lXr8NTcN5q
         xIMSYH14dZLfT7oREmX2XHBXotzMp4CxFnnf7sKu0+gfhxvJ4OH/h23WSw9k8PwQ8wg9
         si3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754347877; x=1754952677;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dbvABf7wfx4E7NOS93rz6Xuay2pfF9NOP8Kzj57STs=;
        b=C49epyhQPc12liDmcmfjVqm0Btmoq0QTkHS1Pu25zTbSNZ7B+JSxhR3rXPcotm/98w
         LN8HCb/Vp/twvwN4c6Yio3bNGaaMnj5YQuXdJvZR4aLvkjLhhb14Wfv/D1ay2RyeiPDI
         f5VAR4s0TTTLEDk4qLNfgctPSs728I3XWGq5NscXZH9CDzfnY18Cs0k5hA+cp9AAmzAx
         ZmmwPlGJYaR9wUs198yvmfg39I4JzBXdXh0wJwSJg4VU87xAt0U/eTKgk1BdvqEPfKug
         N0E6U8IIu9qCKl8xbiT7/OATqzpCrH7XhWfZ96j6GL7lfqwo03BPLxDjEKJo/dQ7DUr0
         6hXw==
X-Gm-Message-State: AOJu0YwRFQBachAYAQ0KLC+EqNMBizDJ+3gzBACfnhwYFpTi2qbNM4mz
	45sCer0752vLD9hY2Bk7fa5HT9cjiGZS+Iah3TEMxEDodqeYCPpDYwKI0sp64Zint7aVfXXqr1N
	NY5uRrLe/PSDXVWMDUTpvi6JVsuYDKtNmVWJn9QGcm7weP8TKZLHu0Cgf
X-Google-Smtp-Source: AGHT+IFfpkr0lG+oTXf+mt+Srq+uY8PGaZJ9D9JbPyEaIppwKUgSK+LjWKgcN2SCdsP/jJxJ5umOrl8ZA6ksQZtnDeYw
MIME-Version: 1.0
X-Received: by 2002:a05:6402:27ce:b0:615:8db4:2612 with SMTP id
 4fb4d7f45d1cf-615e6eb5ba0mr10202906a12.4.1754347876702; Mon, 04 Aug 2025
 15:51:16 -0700 (PDT)
Reply-To: Adalyn Porter3 <adalynporter3@edumachali.cl>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-cabefe86-7f8a-4e07-9586-b0a1d4618e3c@google.com>
Date: Mon, 04 Aug 2025 22:51:16 +0000
Subject: Invitation: Meeting                                        m7p0chwnka
 @ Tue Aug 5, 2025 (linux-firmware@kernel.org)
From: Adalyn Porter3 <adalynporter3@edumachali.cl>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/mixed; boundary="00000000000000ecfd063b91f274"

--00000000000000ecfd063b91f274
Content-Type: multipart/alternative; boundary="00000000000000ecfc063b91f272"

--00000000000000ecfc063b91f272
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

TWVldGluZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtN3AwY2h3bmth
DQpUdWVzZGF5IEF1ZyA1LCAyMDI1DQoNCg0KDQpIZWxsbywgd2UgYXJlIGFjdGl2ZWx5IHNlZWtp
bmcgYSB0cnVzdHdvcnRoeSBzdXBwbGllciB3aG9zZSBwcm9kdWN0cyB3ZSBjYW4gIA0KcmVzZWxs
IGluIG91ciBtYXJrZXQuIElmIHlvdSBhcmUgb3BlbiB0byBhIHBvdGVudGlhbCBwYXJ0bmVyc2hp
cCwgcGxlYXNlICANCmdldCBpbiB0b3VjaCB3aXRoIHVzIHZpYSBXaGF0c0FwcCBhdCArNDggNTMx
IDM3OSA4MzcuDQoNCk9yZ2FuaXplcg0KQWRhbHluIFBvcnRlcjMNCmFkYWx5bnBvcnRlcjNAZWR1
bWFjaGFsaS5jbA0KDQpSZXBseSBmb3IgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZyBhbmQgdmll
dyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2
ZW50P2FjdGlvbj1WSUVXJmVpZD1ORFpuYW5Kb01XdHZOVEF3Y25FMVkyUm9aRzA0WVdwclp6WWdi
R2x1ZFhndFptbHliWGRoY21WQWEyVnlibVZzTG05eVp3JnRvaz1NamNqWVdSaGJIbHVjRzl5ZEdW
eU0wQmxaSFZ0WVdOb1lXeHBMbU5zWTJZNU56VXhOMkU0T0Raak1HWTRNbUkzTlRjM01qVTJOR0U0
TVRka1pXRmpOVGRsTTJFM05RJmN0ej1FdXJvcGUlMkZQYXJpcyZobD1lbiZlcz0wDQpZb3VyIGF0
dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBD
YWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJl
IHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUg
ZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNp
cGllbnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVkIHRv
IHRoZSBndWVzdCBsaXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIgb3du
IGludml0YXRpb24gc3RhdHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3JlIGh0
dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5n
DQo=
--00000000000000ecfc063b91f272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v152/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v144/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v118/WWXFlimHYg6=
HKI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span style=3D"display:none" itemprop=3D"about" itemscope it=
emtype=3D"http://schema.org/Person"><meta itemprop=3D"description" content=
=3D"Invitation from Adalyn Porter3"/></span><span itemprop=3D"object" items=
cope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eventStatus" co=
ntent=3D"http://schema.org/EventScheduled"/><span itemprop=3D"publisher" it=
emscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"name"=
 content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCalend=
ar" content=3D"46gjrh1ko500rq5cdhdm8ajkg6"/><span style=3D"display: none; f=
ont-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; wid=
th: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">Meeti=
ng                                        m7p0chwnka</span><meta itemprop=
=3D"url" content=3D"https://calendar.google.com/calendar/event?action=3DVIE=
W&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcmVAa2VybmV=
sLm9yZw&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjM=
GY4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&=
amp;es=3D0"/><span aria-hidden=3D"true"><time itemprop=3D"startDate" dateti=
me=3D"20250805"></time><time itemprop=3D"endDate" datetime=3D"20250806"></t=
ime></span><div style=3D"display: none; font-size: 1px; color: #fff; line-h=
eight: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; o=
verflow: hidden;">Hello, we are actively seeking a trustworthy supplier who=
se products we can resell in our market. If you are open to a potential par=
tnership, please get in touch with us via WhatsApp at +48 531 379 83</div><=
table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation=
" align=3D"center" style=3D"width:100%;" class=3D"body-container"><tbody><t=
r><td style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td he=
ight=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height:16px;" =
aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![e=
ndif]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td=
 style=3D"border: solid 1px #dadce0; border-radius: 8px; direction: rtl; fo=
nt-size: 0; padding: 24px 32px; text-align: left; vertical-align: top;" cla=
ss=3D"main-container-inner"><!--[if mso | IE]><table border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]--><div class=
=3D"" style=3D"font-size: 13px; text-align: left; direction: ltr; display: =
inline-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap:=
 break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" style=3D"p=
adding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr><td c=
lass=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=
=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; pad=
ding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><d=
iv style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight=
: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c=
4043; text-decoration: none;" class=3D"primary-text" role=3D"presentation">=
<span>Hello, we are actively seeking a trustworthy supplier whose products =
we can resell in our market. If you are open to a potential partnership, pl=
ease get in touch with us via WhatsApp at +48 531 379 837.</span><meta item=
prop=3D"description" content=3D"Hello, we are actively seeking a trustworth=
y supplier whose products we can resell in our market. If you are open to a=
 potential partnership, please get in touch with us via WhatsApp at +48 531=
 379 837."/></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text=
-align: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"f=
ont-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-s=
ize: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-de=
coration: none;" class=3D"primary-text" role=3D"presentation"><span aria-hi=
dden=3D"true"><time itemprop=3D"startDate" datetime=3D"20250805"></time><ti=
me itemprop=3D"endDate" datetime=3D"20250806"></time></span><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"p=
adding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size:=
 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-s=
moothing: antialiased;margin: 0; padding: 0;">When</h2></td></tr></table><s=
pan>Tuesday Aug 5, 2025</span></div></td></tr><tr><td style=3D"font-size: 0=
; padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px=
;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-w=
eight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color=
: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentat=
ion"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presen=
tation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" s=
tyle=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: =
700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Organizer</=
h2></td></tr></table><div style=3D"color: #3c4042;"><span class=3D"notransl=
ate"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-=
block;;color: #3c4043; text-decoration: none;" href=3D"mailto:adalynporter3=
@edumachali.cl">Adalyn Porter3</a></span><span itemprop=3D"organizer" items=
cope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=
=3D"Adalyn Porter3"/><meta itemprop=3D"email" content=3D"adalynporter3@edum=
achali.cl"/></span></div><div style=3D"color: #707579;"><a class=3D"seconda=
ry-text underline-on-hover" style=3D"display: inline-block;;color: #70757a;=
 text-decoration: none;" href=3D"mailto:adalynporter3@edumachali.cl">adalyn=
porter3@edumachali.cl</a></div></div></td></tr><tr><td style=3D"font-size: =
0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:24p=
x;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-=
weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;colo=
r: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presenta=
tion"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" =
style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight:=
 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Guests</h2=
></td></tr></table>(Guest list has been hidden at organizer's request)</div=
></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; wor=
d-break: break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; tex=
t-decoration: none;;font-family: Roboto, sans-serif;font-size: 14px; line-h=
eight: 20px; mso-line-height-rule: exactly; text-align: left;" class=3D"pri=
mary-text"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: ant=
ialiased;">Reply</span><span class=3D"secondary-text" style=3D"color: #7075=
7a; text-decoration: none;"> for <a class=3D"secondary-text underline-on-ho=
ver" style=3D"display: inline-block;;color: #70757a; text-decoration: none;=
" href=3D"mailto:linux-firmware@kernel.org">linux-firmware@kernel.org</a></=
span></div></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-=
align: left; word-break: break-word;;padding-bottom:16px;"><div style=3D"fo=
nt-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-=
height-rule: exactly; text-align: left;"><table border=3D"0" cellpadding=3D=
"0" cellspacing=3D"0" role=3D"presentation" style=3D"border-collapse: separ=
ate;"><tr><td style=3D"padding-top: 8px; padding-left: 0; padding-right: 12=
px;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-rad=
ius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;;display: inline-block;;margin-right: 12px; margin-left: 0=
;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presentation"=
><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org=
/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/Rsv=
pAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"http://s=
chema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schem=
a.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"ht=
tps://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNDZnanJ=
oMWtvNTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D1=
&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjMGY4MmI3=
NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=
=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto,=
 sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-he=
ight-rule: exactly; margin: 0; text-decoration: none; text-transform: none;=
" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td =
align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: =
6px 0; padding-left: 16px; padding-right: 12px; white-space: nowrap;"><!--[=
if mso]><a href=3D"https://calendar.google.com/calendar/event?action=3DRESP=
OND&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcmVAa2Vyb=
mVsLm9yZw&amp;rst=3D1&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y=
5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEurope%2FPari=
s&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" targe=
t=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-wei=
ght: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6=
368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; mar=
gin: 0; text-decoration: none; text-transform: none;">Yes</span><!--[if mso=
]></a><![endif]--></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D"border=
-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"=
/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAc=
tionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReques=
tMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2R=
oZG04YWprZzYgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D2&amp;tok=3DMjcjY=
WRhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdk=
ZWFjNTdlM2E3NQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"fo=
nt-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color=
: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactl=
y; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-b=
utton-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadd=
ing=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" =
role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 12px; white-s=
pace: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar=
/event?action=3DRESPOND&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbGlud=
XgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D2&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0B=
lZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp=
;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" it=
emprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-tex=
t" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sa=
ns-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-heigh=
t-rule: exactly; margin: 0; text-decoration: none; text-transform: none;">N=
o</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></span></=
span></td><td align=3D"center" vertical-align=3D"middle" role=3D"presentati=
on"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.=
org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/=
RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"htt=
p://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://=
schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=
=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DN=
DZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;r=
st=3D3&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjMG=
Y4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&a=
mp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-li=
ne-height-rule: exactly; margin: 0; text-decoration: none; text-transform: =
none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table=
 border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr=
><td align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padd=
ing: 6px 0; padding-left: 12px; padding-right: 16px; white-space: nowrap;">=
<!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcm=
VAa2VybmVsLm9yZw&amp;rst=3D3&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNoYWxp=
LmNsY2Y5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEurope=
%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url=
" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"f=
ont-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;colo=
r: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exact=
ly; margin: 0; text-decoration: none; text-transform: none;">Maybe</span><!=
--[if mso]></a><![endif]--></td></tr></table></a></span></span></span></td>=
</tr></table><!-- More options --><a href=3D"https://calendar.google.com/ca=
lendar/event?action=3DVIEW&amp;eid=3DNDZnanJoMWtvNTAwcnE1Y2RoZG04YWprZzYgbG=
ludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMjcjYWRhbHlucG9ydGVyM0BlZHVtYWNo=
YWxpLmNsY2Y5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdkZWFjNTdlM2E3NQ&amp;ctz=3DEu=
rope%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-w=
eight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5=
f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; m=
argin: 0; text-decoration: none; text-transform: none;" class=3D"grey-butto=
n-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-rad=
ius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" role=
=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-righ=
t: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"http=
s://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNDZnanJoMWtv=
NTAwcnE1Y2RoZG04YWprZzYgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMjcjYW=
RhbHlucG9ydGVyM0BlZHVtYWNoYWxpLmNsY2Y5NzUxN2E4ODZjMGY4MmI3NTc3MjU2NGE4MTdkZ=
WFjNTdlM2E3NQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"gre=
y-button-text" target=3D"_blank"><![endif]--><span class=3D"grey-button-tex=
t" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sa=
ns-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-heigh=
t-rule: exactly; margin: 0; text-decoration: none; text-transform: none;">M=
ore options</span><!--[if mso]></a><![endif]--></td></tr></table></a></td><=
/tr></table></div></td></tr></table></td></tr></tbody></table></div><!--[if=
 mso | IE]></tr></table><![endif]--></td></tr></tbody></table><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"c=
enter" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size: =
0; padding: 0; text-align: left; word-break: break-word;;padding:4px 12px;"=
 class=3D"" align=3D"left"><div class=3D"secondary-text" style=3D"color: #7=
0757a; text-decoration: none;font-family: Roboto, sans-serif;font-size: 12p=
x; line-height: 16px; mso-line-height-rule: exactly; text-align: left;"><p>=
Invitation from <a href=3D"https://calendar.google.com/calendar/" class=3D"=
accent-text underline-on-hover" style=3D"font-family: Roboto, sans-serif;fo=
nt-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;color: #1a=
73e8; text-decoration: none;" target=3D"_blank">Google Calendar</a></p><p>Y=
ou are receiving this email because you are an attendee on the event.</p><p=
>Forwarding this invitation could allow any recipient to send a response to=
 the organizer, be added to the guest list, invite others regardless of the=
ir own invitation status, or modify your RSVP. <a class=3D"accent-text unde=
rline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; l=
ine-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decor=
ation: none;" href=3D"https://support.google.com/calendar/answer/37135#forw=
arding">Learn more</a></p></div></td></tr></tbody></table></td></tr></tbody=
></table></span></span></body></html>
--00000000000000ecfc063b91f272
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART;VALUE=DATE:20250805
DTEND;VALUE=DATE:20250806
DTSTAMP:20250804T225116Z
ORGANIZER;CN=Adalyn Porter3:mailto:adalynporter3@edumachali.cl
UID:46gjrh1ko500rq5cdhdm8ajkg6@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=linux-firmware@kernel.org;X-NUM-GUESTS=0:mailto:linux-firmware@kern
 el.org
X-MICROSOFT-CDO-OWNERAPPTID:898685517
CREATED:20250804T225111Z
DESCRIPTION:Hello\, we are actively seeking a trustworthy supplier whose pr
 oducts we can resell in our market. If you are open to a potential partners
 hip\, please get in touch with us via WhatsApp at +48 531 379 837.
LAST-MODIFIED:20250804T225111Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Meeting                                        m7p0chwnka
TRANSP:TRANSPARENT
END:VEVENT
END:VCALENDAR

--00000000000000ecfc063b91f272--
--00000000000000ecfd063b91f274
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUO1ZBTFVFPURBVEU6MjAyNTA4MDUNCkRURU5EO1ZBTFVF
PURBVEU6MjAyNTA4MDYNCkRUU1RBTVA6MjAyNTA4MDRUMjI1MTE2Wg0KT1JHQU5JWkVSO0NOPUFk
YWx5biBQb3J0ZXIzOm1haWx0bzphZGFseW5wb3J0ZXIzQGVkdW1hY2hhbGkuY2wNClVJRDo0Nmdq
cmgxa281MDBycTVjZGhkbThhamtnNkBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJ
RFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBU
UlVFO0NOPWxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmxp
bnV4LWZpcm13YXJlQGtlcm4NCiBlbC5vcmcNClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDo4
OTg2ODU1MTcNCkNSRUFURUQ6MjAyNTA4MDRUMjI1MTExWg0KREVTQ1JJUFRJT046SGVsbG9cLCB3
ZSBhcmUgYWN0aXZlbHkgc2Vla2luZyBhIHRydXN0d29ydGh5IHN1cHBsaWVyIHdob3NlIHByDQog
b2R1Y3RzIHdlIGNhbiByZXNlbGwgaW4gb3VyIG1hcmtldC4gSWYgeW91IGFyZSBvcGVuIHRvIGEg
cG90ZW50aWFsIHBhcnRuZXJzDQogaGlwXCwgcGxlYXNlIGdldCBpbiB0b3VjaCB3aXRoIHVzIHZp
YSBXaGF0c0FwcCBhdCArNDggNTMxIDM3OSA4MzcuDQpMQVNULU1PRElGSUVEOjIwMjUwODA0VDIy
NTExMVoNCkxPQ0FUSU9OOg0KU0VRVUVOQ0U6MA0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTpN
ZWV0aW5nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG03cDBjaHdua2EN
ClRSQU5TUDpUUkFOU1BBUkVOVA0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--00000000000000ecfd063b91f274--
