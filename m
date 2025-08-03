Return-Path: <SRS0=1Nub=2P=edumachali.cl=adalynnrichmond3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136A8C87FD2
	for <linux-firmware@archiver.kernel.org>; Sun,  3 Aug 2025 00:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBB25C4CEF4; Sun,  3 Aug 2025 00:03:06 +0000 (UTC)
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBEADC4CEEF
	for <linux-firmware@kernel.org>; Sun,  3 Aug 2025 00:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBEADC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=edumachali.cl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=edumachali.cl
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6154cf8c32cso2995774a12.1
        for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754179384; x=1754784184; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEWnnAVcCCaLE+h+MgZ0fFo5MEjXBRoT0xlbuUu0jmY=;
        b=fR8vC2bmbHeXRwFx/E3om1bzOukg2urmq50TdHJEtsHflpyX+fvgcgQGKDQLYZRZXY
         fe6xIYrMsQgPDLvqBf9sSrK1q3i5rQNpM3pHlafBxIy2BV4NJyNLnlveJTWSFbZbmuj2
         s1Fr2iqOrBvjW9fgATHIKQEFpx1Yi1395Oc8bFwJaJEOjnX8wB8aJ67aMtzkJZhIa8eP
         3rJjmjocitihemR2BR1JVBYiBfAaKHGah+rFw08c2tR05RfmPSW5L7ZPm6JwaG0ZvLyu
         tJtO5sy/EiUOBur7lc/mxaaVndH9Yxzri4m02lr7mGxCsxwc2Xkz4XDp5P6ndiY/1REf
         1n3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edumachali-cl.20230601.gappssmtp.com; s=20230601; t=1754179384; x=1754784184; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEWnnAVcCCaLE+h+MgZ0fFo5MEjXBRoT0xlbuUu0jmY=;
        b=ruivFnf0+UF/X/Qod7AQf619bK6CI3ufDDnkIj8sl/h1NagSQXLv6IP297iRs66J71
         P3ij7Z6B7L4BYnH06a8n+cYv3YkNf2UpBexjQYZmMI4PUaw5nVZzMdPxX95Nbk/u0vkX
         L/y8JlRybu4iavic6mtID1IWVMFJVFvonmQplQDpmuNB9hChaJvF6E0mNihD1ER+cg9G
         fHeK3FwtuOef89DdLYA/XnibT5K/KxysyUAZWRlLd1NDH/9j4eDagXNAClsJ2yr+PwHN
         rmBtjCcBoUrcODkciEviArvXd65XkNQKtpPtH1bVq9Cgbg6AQWhFUZCx+/wIcAWurdqa
         FUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754179384; x=1754784184;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEWnnAVcCCaLE+h+MgZ0fFo5MEjXBRoT0xlbuUu0jmY=;
        b=rSjzOg4g93MIGGW+QbB5MWfwpwW/Ws39EHW6K9eOvw57Q42D7IqjdKo5CnY+g5XWaG
         4OyLmKeokrYnatbKDj3qrnqnQGSjqDpCJlX1pQQgT+hYPD8Iy0bRAPS2gQly4aohfZVE
         BdZBPfQkuECQRMHdkD5hfRsivMfGWlvmgb6hXva8wsZYSRWDq9nXjhNUKgnSRmDjGegv
         5fD5+3mliSpnSD6n24NV1IPoNQtzQRMoKRIo2TqrQJQR1Hu09FpDwSyn5k8xhbJUXKXy
         9KlAZQ03n913Juf0hlbUlyBRLyIbfIvZ+JSu9v+qT0ECxR9UYTqyVY0uWIZT9BqjNh7P
         SJQg==
X-Gm-Message-State: AOJu0YygkEcsKoofI9o85bsi4X4oCjaYUBDiYpDmu8q0/wWTA2W/TMYI
	6rWKKiGFnOTV7wJWCJ6YBYyFR0Ajs810Wv/e+i4lVqWfJDgDknlAx+jweGnHZ3tQJ8sWwNgdBbl
	1qBSgJu361K2+rusuBHzoPFxQVfsFm+8CPTQkjUq+kvPv3k2fd8UJaBnA
X-Google-Smtp-Source: AGHT+IHa+6Ya+XXjmGwwhEDieIJrc+/sj3bs0vwfLJolquyXxQt6c8BENHpLbdBfmrodRDTzziHMuX6eKgHnLLZexIyN
MIME-Version: 1.0
X-Received: by 2002:a05:6402:254e:b0:615:9851:72b3 with SMTP id
 4fb4d7f45d1cf-615e6eb5e13mr3621503a12.2.1754179383931; Sat, 02 Aug 2025
 17:03:03 -0700 (PDT)
Reply-To: Adalynn Richmond3 <adalynnrichmond3@edumachali.cl>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-0608326a-6760-46ac-953f-9eda9905d095@google.com>
Date: Sun, 03 Aug 2025 00:03:03 +0000
Subject: Invitation: (No Subject) @ Sun Aug 3, 2025 (linux-firmware@kernel.org)
From: Adalynn Richmond3 <adalynnrichmond3@edumachali.cl>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/mixed; boundary="0000000000000d4115063b6ab750"

--0000000000000d4115063b6ab750
Content-Type: multipart/alternative; boundary="0000000000000d4113063b6ab74e"

--0000000000000d4113063b6ab74e
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

KE5vIFN1YmplY3QpDQpTdW5kYXkgQXVnIDMsIDIwMjUNCg0KDQoNClBsZWFzZSBjb250YWN0IHVz
IG9uIHdoYXRzIGFwcCArNDggNTA0NjM3MzI2IFdlIHdvdWxkIGxpa2UgdG8gZ2V0IGEgYml0ICAN
Cm1vcmUgaW5mb3JtYXRpb24gYWJvdXQgd2hhdCB5b3UgcHJvdmlkZSwgYmVjYXVzZSB3ZSBhcmUg
aW50ZXJlc3RlZCBpbiBsb25nICANCnRlcm0gYW5kIHdlIGNhbiBvcmRlciBhIGxvdA0KDQpPcmdh
bml6ZXINCkFkYWx5bm4gUmljaG1vbmQzDQphZGFseW5ucmljaG1vbmQzQGVkdW1hY2hhbGkuY2wN
Cg0KUmVwbHkgZm9yIGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmcgYW5kIHZpZXcgbW9yZSBkZXRh
aWxzICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249
VklFVyZlaWQ9Tm1OamRUZDBhbU54YW1RemJUYzBZVFZxT1dnME9XMDRZVzBnYkdsdWRYZ3RabWx5
YlhkaGNtVkFhMlZ5Ym1Wc0xtOXladyZ0b2s9TXpBallXUmhiSGx1Ym5KcFkyaHRiMjVrTTBCbFpI
VnRZV05vWVd4cExtTnNNV1ZrWWpCaU9EZGhaRFkwWlRReE1qazNORGcyT0RVNU1qTTRaakppWVRR
eU9HWXhPR05sT1EmY3R6PUV1cm9wZSUyRlBhcmlzJmhsPWVuJmVzPTANCllvdXIgYXR0ZW5kYW5j
ZSBpcyBvcHRpb25hbC4NCg0Kfn4vL35+DQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFy
OiBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvDQoNCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9uIHRoZSBldmVudC4N
Cg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0
byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2FuaXplciwgYmUgYWRkZWQgdG8gdGhlIGd1
ZXN0IGxpc3QsIGludml0ZSBvdGhlcnMgcmVnYXJkbGVzcyBvZiAgDQp0aGVpciBvd24gaW52aXRh
dGlvbiBzdGF0dXMsIG9yIG1vZGlmeSB5b3VyIFJTVlAuDQoNCkxlYXJuIG1vcmUgaHR0cHM6Ly9z
dXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--0000000000000d4113063b6ab74e
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
=3D"Invitation from Adalynn Richmond3"/></span><span itemprop=3D"object" it=
emscope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eventStatus"=
 content=3D"http://schema.org/EventScheduled"/><span itemprop=3D"publisher"=
 itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"na=
me" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCal=
endar" content=3D"6ccu7tjcqjd3m74a5j9h49m8am"/><span style=3D"display: none=
; font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; =
width: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">(N=
o Subject)</span><meta itemprop=3D"url" content=3D"https://calendar.google.=
com/calendar/event?action=3DVIEW&amp;eid=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04=
YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0=
BlZHVtYWNoYWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&am=
p;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0"/><span aria-hidden=3D"true">=
<time itemprop=3D"startDate" datetime=3D"20250803"></time><time itemprop=3D=
"endDate" datetime=3D"20250804"></time></span><div style=3D"display: none; =
font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; wi=
dth: 0; max-width: 0; opacity: 0; overflow: hidden;">Please contact us on w=
hats app +48 504637326 We would like to get a bit more information about wh=
at you provide, because we are interested in long term and we can order a l=
ot</div><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" align=3D"center" style=3D"width:100%;" class=3D"body-container">=
<tbody><tr><td style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><t=
r><td height=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height=
:16px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></ta=
ble><![endif]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody=
><tr><td style=3D"border: solid 1px #dadce0; border-radius: 8px; direction:=
 rtl; font-size: 0; padding: 24px 32px; text-align: left; vertical-align: t=
op;" class=3D"main-container-inner"><!--[if mso | IE]><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]--><d=
iv class=3D"" style=3D"font-size: 13px; text-align: left; direction: ltr; d=
isplay: inline-block; vertical-align: top; width: 100%;overflow: hidden; wo=
rd-wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"=
0" role=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" sty=
le=3D"padding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><t=
r><td class=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
width=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0=
; padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px=
;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-w=
eight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color=
: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentat=
ion"><span>Please contact us on whats app +48 504637326 We would like to ge=
t a bit more information about what you provide, because we are interested =
in long term and we can order a lot</span><meta itemprop=3D"description" co=
ntent=3D"Please contact us on whats app +48 504637326 We would like to get =
a bit more information about what you provide, because we are interested in=
 long term and we can order a lot"/></div></td></tr><tr><td style=3D"font-s=
ize: 0; padding: 0; text-align: left; word-break: break-word;;padding-botto=
m:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; =
font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px=
;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pre=
sentation"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=
=3D"20250803"></time><time itemprop=3D"endDate" datetime=3D"20250804"></tim=
e></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-tex=
t" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weig=
ht: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h=
2></td></tr></table><span>Sunday Aug 3, 2025</span></div></td></tr><tr><td =
style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word=
;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-=
style: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter=
-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-te=
xt" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 cla=
ss=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoratio=
n: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; pad=
ding: 0;">Organizer</h2></td></tr></table><div style=3D"color: #3c4042;"><s=
pan class=3D"notranslate"><a class=3D"primary-text underline-on-hover" styl=
e=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D=
"mailto:adalynnrichmond3@edumachali.cl">Adalynn Richmond3</a></span><span i=
temprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Person"><meta=
 itemprop=3D"name" content=3D"Adalynn Richmond3"/><meta itemprop=3D"email" =
content=3D"adalynnrichmond3@edumachali.cl"/></span></div><div style=3D"colo=
r: #707579;"><a class=3D"secondary-text underline-on-hover" style=3D"displa=
y: inline-block;;color: #70757a; text-decoration: none;" href=3D"mailto:ada=
lynnrichmond3@edumachali.cl">adalynnrichmond3@edumachali.cl</a></div></div>=
</td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word=
-break: break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto=
, sans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-he=
ight: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" c=
lass=3D"primary-text" role=3D"presentation"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px=
;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c40=
43; text-decoration: none;font-weight: 700;-webkit-font-smoothing: antialia=
sed;margin: 0; padding: 0;">Guests</h2></td></tr></table>(Guest list has be=
en hidden at organizer's request)</div></td></tr><tr><td style=3D"font-size=
: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:0=
px;"><div style=3D"color: #3c4043; text-decoration: none;;font-family: Robo=
to, sans-serif;font-size: 14px; line-height: 20px; mso-line-height-rule: ex=
actly; text-align: left;" class=3D"primary-text"><div><span style=3D"font-w=
eight: 700;-webkit-font-smoothing: antialiased;">Reply</span><span class=3D=
"secondary-text" style=3D"color: #70757a; text-decoration: none;"> for <a c=
lass=3D"secondary-text underline-on-hover" style=3D"display: inline-block;;=
color: #70757a; text-decoration: none;" href=3D"mailto:linux-firmware@kerne=
l.org">linux-firmware@kernel.org</a></span></div></div></td></tr><tr><td st=
yle=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;=
padding-bottom:16px;"><div style=3D"font-family: Roboto, sans-serif;font-si=
ze: 14px; line-height: 20px; mso-line-height-rule: exactly; text-align: lef=
t;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"present=
ation" style=3D"border-collapse: separate;"><tr><td style=3D"padding-top: 8=
px; padding-left: 0; padding-right: 12px;"><!-- RSVP buttons --><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D=
"border: solid 1px #dadce0; border-radius: 16px; border-collapse: separate;=
font-family: &#39;Google Sans&#39;, Roboto, sans-serif;;display: inline-blo=
ck;;margin-right: 12px; margin-left: 0;"><tr><td align=3D"center" vertical-=
align=3D"middle" role=3D"presentation"><span itemprop=3D"potentialaction" i=
temscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attend=
ance" content=3D"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"h=
andler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><link it=
emprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><span s=
tyle=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calendar/ev=
ent?action=3DRESPOND&amp;eid=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04YW0gbGludXgt=
ZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D1&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0=
BlZHVtYWNoYWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&am=
p;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;fo=
nt-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-s=
ize: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; tex=
t-decoration: none; text-transform: none;" class=3D"grey-button-text" itemp=
rop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspa=
cing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"presentat=
ion" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 16px; padding=
-right: 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https://calenda=
r.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNmNjdTd0amNxamQzbTc0=
YTVqOWg0OW04YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D1&amp;tok=3DMz=
AjYWRhbHlubnJpY2htb25kM0BlZHVtYWNoYWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5M=
jM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" clas=
s=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span=
 class=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Goo=
gle Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-hei=
ght: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none;=
 text-transform: none;">Yes</span><!--[if mso]></a><![endif]--></td></tr></=
table></a></span></span></span></td><td align=3D"center" vertical-align=3D"=
middle" role=3D"presentation" style=3D"border-left: solid 1px #dadce0; bord=
er-right: solid 1px #dadce0;"><span itemprop=3D"potentialaction" itemscope =
itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" con=
tent=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" it=
emscope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"=
method" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"co=
lor: #5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04YW0gbGludXgtZmlybXdhcm=
VAa2VybmVsLm9yZw&amp;rst=3D2&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0BlZHVtYWNo=
YWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEu=
rope%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family:=
 &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px;=
 line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decorati=
on: none; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url=
" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"=
 role=3D"presentation"><tr><td align=3D"center" role=3D"presentation" valig=
n=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]=
><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp=
;eid=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9y=
Zw&amp;rst=3D2&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0BlZHVtYWNoYWxpLmNsMWVkYj=
BiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEurope%2FParis&a=
mp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weig=
ht: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f63=
68; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; marg=
in: 0; text-decoration: none; text-transform: none;">No</span><!--[if mso]>=
</a><![endif]--></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/May=
be"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/Htt=
pActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReq=
uestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calenda=
r.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNmNjdTd0amNxamQzbTc0=
YTVqOWg0OW04YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D3&amp;tok=3DMz=
AjYWRhbHlubnJpY2htb25kM0BlZHVtYWNoYWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5M=
jM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" styl=
e=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-seri=
f;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule:=
 exactly; margin: 0; text-decoration: none; text-transform: none;" class=3D=
"grey-button-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"c=
enter" role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 0; pad=
ding-left: 12px; padding-right: 16px; white-space: nowrap;"><!--[if mso]><a=
 href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;ei=
d=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&=
amp;rst=3D3&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0BlZHVtYWNoYWxpLmNsMWVkYjBiO=
DdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEurope%2FParis&amp;=
hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_=
blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weight: 4=
00;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; f=
ont-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0=
; text-decoration: none; text-transform: none;">Maybe</span><!--[if mso]></=
a><![endif]--></td></tr></table></a></span></span></span></td></tr></table>=
<!-- More options --><a href=3D"https://calendar.google.com/calendar/event?=
action=3DVIEW&amp;eid=3DNmNjdTd0amNxamQzbTc0YTVqOWg0OW04YW0gbGludXgtZmlybXd=
hcmVAa2VybmVsLm9yZw&amp;tok=3DMzAjYWRhbHlubnJpY2htb25kM0BlZHVtYWNoYWxpLmNsM=
WVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGYxOGNlOQ&amp;ctz=3DEurope%2FPa=
ris&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-weight: 40=
0;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; fo=
nt-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0;=
 text-decoration: none; text-transform: none;" class=3D"grey-button-text" t=
arget=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"border: solid 1px #dadce0; border-radius: 16px=
; border-collapse: separate;font-family: &#39;Google Sans&#39;, Roboto, san=
s-serif;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presen=
tation" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; w=
hite-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"https://calend=
ar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNmNjdTd0amNxamQzbTc0YT=
VqOWg0OW04YW0gbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMzAjYWRhbHlubnJp=
Y2htb25kM0BlZHVtYWNoYWxpLmNsMWVkYjBiODdhZDY0ZTQxMjk3NDg2ODU5MjM4ZjJiYTQyOGY=
xOGNlOQ&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"grey-butt=
on-text" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">More op=
tions</span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr></=
table></div></td></tr></table></td></tr></tbody></table></div><!--[if mso |=
 IE]></tr></table><![endif]--></td></tr></tbody></table><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center"=
 style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; pad=
ding: 0; text-align: left; word-break: break-word;;padding:4px 12px;" class=
=3D"" align=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a;=
 text-decoration: none;font-family: Roboto, sans-serif;font-size: 12px; lin=
e-height: 16px; mso-line-height-rule: exactly; text-align: left;"><p>Invita=
tion from <a href=3D"https://calendar.google.com/calendar/" class=3D"accent=
-text underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-siz=
e: 12px; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; =
text-decoration: none;" target=3D"_blank">Google Calendar</a></p><p>You are=
 receiving this email because you are an attendee on the event.</p><p>Forwa=
rding this invitation could allow any recipient to send a response to the o=
rganizer, be added to the guest list, invite others regardless of their own=
 invitation status, or modify your RSVP. <a class=3D"accent-text underline-=
on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-he=
ight: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration:=
 none;" href=3D"https://support.google.com/calendar/answer/37135#forwarding=
">Learn more</a></p></div></td></tr></tbody></table></td></tr></tbody></tab=
le></span></span></body></html>
--0000000000000d4113063b6ab74e
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART;VALUE=DATE:20250803
DTEND;VALUE=DATE:20250804
DTSTAMP:20250803T000303Z
ORGANIZER;CN=Adalynn Richmond3:mailto:adalynnrichmond3@edumachali.cl
UID:6ccu7tjcqjd3m74a5j9h49m8am@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=linux-firmware@kernel.org;X-NUM-GUESTS=0:mailto:linux-firmware@kern
 el.org
X-MICROSOFT-CDO-OWNERAPPTID:-1598865599
CREATED:20250803T000300Z
DESCRIPTION:Please contact us on whats app +48 504637326 We would like to g
 et a bit more information about what you provide\, because we are intereste
 d in long term and we can order a lot
LAST-MODIFIED:20250803T000301Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:
TRANSP:TRANSPARENT
END:VEVENT
END:VCALENDAR

--0000000000000d4113063b6ab74e--
--0000000000000d4115063b6ab750
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUO1ZBTFVFPURBVEU6MjAyNTA4MDMNCkRURU5EO1ZBTFVF
PURBVEU6MjAyNTA4MDQNCkRUU1RBTVA6MjAyNTA4MDNUMDAwMzAzWg0KT1JHQU5JWkVSO0NOPUFk
YWx5bm4gUmljaG1vbmQzOm1haWx0bzphZGFseW5ucmljaG1vbmQzQGVkdW1hY2hhbGkuY2wNClVJ
RDo2Y2N1N3RqY3FqZDNtNzRhNWo5aDQ5bThhbUBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9
SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD0NCiBUUlVFO0NOPWxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7WC1OVU0tR1VFU1RTPTA6bWFp
bHRvOmxpbnV4LWZpcm13YXJlQGtlcm4NCiBlbC5vcmcNClgtTUlDUk9TT0ZULUNETy1PV05FUkFQ
UFRJRDotMTU5ODg2NTU5OQ0KQ1JFQVRFRDoyMDI1MDgwM1QwMDAzMDBaDQpERVNDUklQVElPTjpQ
bGVhc2UgY29udGFjdCB1cyBvbiB3aGF0cyBhcHAgKzQ4IDUwNDYzNzMyNiBXZSB3b3VsZCBsaWtl
IHRvIGcNCiBldCBhIGJpdCBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHdoYXQgeW91IHByb3ZpZGVc
LCBiZWNhdXNlIHdlIGFyZSBpbnRlcmVzdGUNCiBkIGluIGxvbmcgdGVybSBhbmQgd2UgY2FuIG9y
ZGVyIGEgbG90DQpMQVNULU1PRElGSUVEOjIwMjUwODAzVDAwMDMwMVoNCkxPQ0FUSU9OOg0KU0VR
VUVOQ0U6MA0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWToNClRSQU5TUDpUUkFOU1BBUkVOVA0K
RU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--0000000000000d4115063b6ab750--
