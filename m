Return-Path: <SRS0=AajI=2P=edumachali.cl=addilynconley3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69CDC87FCA
	for <linux-firmware@archiver.kernel.org>; Sun,  3 Aug 2025 22:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E38EC4CEF0; Sun,  3 Aug 2025 22:45:36 +0000 (UTC)
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 513AFC4CEEB
	for <linux-firmware@kernel.org>; Sun,  3 Aug 2025 22:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 513AFC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=edumachali.cl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=edumachali.cl
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61530559847so3287262a12.0
        for <linux-firmware@kernel.org>; Sun, 03 Aug 2025 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754261132; x=1754865932; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KrGbiMKzhgaTmHwMGdei+73sacuFL2ydzw+HzVpFwNE=;
        b=bMRZeJYy9u3hFqwymCDFl6FnrVxmhYG/GCc2SDWC15XYS0MWLBFCn5l79JW4E5SXJ6
         AFa45gGz9RJN31oJnArdJEsFunZN7NXil/s++LZCe2dh0TVx+pUDH8v7sDHfVluaeBc4
         JVmhLbi5Ni6xmZfACtKheLK8ER8jSoQzGyhLb10cGwSDgb+rk2Yl6/keW6JikwIbfj84
         L4M2BWQwXAkC3YWFriFYWXZUu20Yziq8U+nqKhdF1rJyfnC5gYGDEaENh398rvSAh2co
         uxk7oUI6+8ivyl57rMFICat7f0JZo6IojaaJAWhyR4l3g4oV6h4+augfOTSw0hvs3Ktq
         PIAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edumachali-cl.20230601.gappssmtp.com; s=20230601; t=1754261132; x=1754865932; darn=kernel.org;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KrGbiMKzhgaTmHwMGdei+73sacuFL2ydzw+HzVpFwNE=;
        b=rSPnpQq+nga0H3MfMhaTN6mQREvSHYv10Mx7otR0Bg71gUBi0ZoVCUPVOuDA4+bq3g
         gETv0wJ/7lCbT1Xt7uO6z4vdmJS9THjZEJpgvXq8pU/4VCNkai7NwyeBVo7g7os2y0Jy
         6T0I8WHRFmRqRcX4rCmn4I5NJfJ5DX7DOtWZhbCdzR3iNyRd+o8t3jX2iRg66Ft37Gud
         D3H1N9WO2ytxrB/GKzJqsoqREpFgmea4ip3QIMpGl2bOZr3CX+eXH/b9ZQ16scZrXSv6
         caJTvadSyHOwvjAkI+cR4BNVVXCEpW65NpNvovkt3PKQjkpR/agzYYMiE3Qj6O3WlSSp
         YkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754261132; x=1754865932;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrGbiMKzhgaTmHwMGdei+73sacuFL2ydzw+HzVpFwNE=;
        b=BD1YWK6TwXkUHGNae+87QRqgOUwqKakuENbObN/mczuBIy3Dg1l9O15gzd/5dYRvyV
         +4UFC3LkfRU9Em2Z75/Py8FMrtZD1Ll0LyK5IPYgK+EYQotD7bP8eL9GTtlX0Ht+WU0j
         yePNIFrUrIgf+/8KzB+YrO1NP3divjUc70ZkH0WbaH8u51fi1q+XG9XsYNwCo4OFqioP
         hvfZNjKozlAhIu7spTTiJ/bFIr0xmN6Noohwxl+dIffUmF1nu1CyvdeD9k3TN7h0chTB
         CnTLuyzw5Wb5a3T6qYBXm3Qhg5pFZmeRXLPVRwXkQGGN/QmgHwrSCbRMh91kVUd/4kn6
         1ddQ==
X-Gm-Message-State: AOJu0Yy4RrjH9rPkqXim9m7ATxChPOxMhRLM2aZizzwDkKu10h7xeQnD
	AoRPCdR8foy424BNzKFQXXBwYhGa9z7y5KTZqlnZEskL32k88pM2ST4haMhHDnWp5Ye/FQX8Zv+
	LXd/KNKAASPl7ZnKkjIZ/RawsMc0eFxg2ako/D/XuO5afbwyaUXLwcfEk
X-Google-Smtp-Source: AGHT+IFGElr6RE3QGQx/JkIbqD6lOH2xRMNIgIa9TYY8brmMHW4+G+Jz0hGOtyUUlJ/oZK9I8RGoPjDzaB+ZY0eoRwFf
MIME-Version: 1.0
X-Received: by 2002:a05:6402:42c9:b0:615:1563:4462 with SMTP id
 4fb4d7f45d1cf-615e6ebea9cmr6224679a12.2.1754261132261; Sun, 03 Aug 2025
 15:45:32 -0700 (PDT)
Reply-To: Addilyn Conley3 <addilynconley3@edumachali.cl>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-22ff607c-5b14-4fed-840a-d89562a09a06@google.com>
Date: Sun, 03 Aug 2025 22:45:32 +0000
Subject: Invitation: Meeting                                        0xewrrmty7
 @ Mon Aug 4, 2025 (linux-firmware@kernel.org)
From: Addilyn Conley3 <addilynconley3@edumachali.cl>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/mixed; boundary="000000000000a1c1c4063b7dbf5d"

--000000000000a1c1c4063b7dbf5d
Content-Type: multipart/alternative; boundary="000000000000a1c1c3063b7dbf5b"

--000000000000a1c1c3063b7dbf5b
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

TWVldGluZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGV3cnJtdHk3
DQpNb25kYXkgQXVnIDQsIDIwMjUNCg0KDQoNClBsZWFzZSBjb250YWN0IHVzIG9uIHdoYXRzIGFw
cCArNDggNTMxMzc5ODM3IFdlIHdvdWxkIGxpa2UgdG8gZ2V0IGEgYml0ICANCm1vcmUgaW5mb3Jt
YXRpb24gYWJvdXQgd2hhdCB5b3UgcHJvdmlkZSwgYmVjYXVzZSB3ZSBhcmUgaW50ZXJlc3RlZCBp
biBsb25nICANCnRlcm0gYW5kIHdlIGNhbiBvcmRlciBhIGxvdA0KDQpPcmdhbml6ZXINCkFkZGls
eW4gQ29ubGV5Mw0KYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbA0KDQpSZXBseSBmb3IgbGlu
dXgtZmlybXdhcmVAa2VybmVsLm9yZyBhbmQgdmlldyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9j
YWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1ObkJ6Y21G
bmRtWTBkVzlxTWpGbmREazFjV00wTVdNeGEzWWdiR2x1ZFhndFptbHliWGRoY21WQWEyVnlibVZz
TG05eVp3JnRvaz1NamdqWVdSa2FXeDVibU52Ym14bGVUTkFaV1IxYldGamFHRnNhUzVqYkdOallX
TmxPV0ppWVdSbE5HTTRaVFptWkRWaU5qQmpNV1U0T1RjeE56ZGpNV000TVdZMllqYyZjdHo9RXVy
b3BlJTJGUGFyaXMmaGw9ZW4mZXM9MA0KWW91ciBhdHRlbmRhbmNlIGlzIG9wdGlvbmFsLg0KDQp+
fi8vfn4NCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vY2FsZW5kYXIu
Z29vZ2xlLmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNlaXZpbmcgdGhpcyBlbWFpbCBiZWNh
dXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb24gdGhlIGV2ZW50Lg0KDQpGb3J3YXJkaW5nIHRoaXMg
aW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0
byAgDQp0aGUgb3JnYW5pemVyLCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgaW52aXRlIG90
aGVycyByZWdhcmRsZXNzIG9mICANCnRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgbW9k
aWZ5IHlvdXIgUlNWUC4NCg0KTGVhcm4gbW9yZSBodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9j
YWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--000000000000a1c1c3063b7dbf5b
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
=3D"Invitation from Addilyn Conley3"/></span><span itemprop=3D"object" item=
scope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eventStatus" c=
ontent=3D"http://schema.org/EventScheduled"/><span itemprop=3D"publisher" i=
temscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"name=
" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCalen=
dar" content=3D"6psragvf4uoj21gt95qc41c1kv"/><span style=3D"display: none; =
font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; wi=
dth: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">Meet=
ing                                        0xewrrmty7</span><meta itemprop=
=3D"url" content=3D"https://calendar.google.com/calendar/event?action=3DVIE=
W&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2VybmV=
sLm9yZw&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlN=
GM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FParis&amp;hl=3Den=
&amp;es=3D0"/><span aria-hidden=3D"true"><time itemprop=3D"startDate" datet=
ime=3D"20250804"></time><time itemprop=3D"endDate" datetime=3D"20250805"></=
time></span><div style=3D"display: none; font-size: 1px; color: #fff; line-=
height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; =
overflow: hidden;">Please contact us on whats app +48 531379837 We would li=
ke to get a bit more information about what you provide, because we are int=
erested in long term and we can order a lot</div><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D"body-container"><tbody><tr><td style=3D"" class=
=3D"" align=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"16" style=3D"he=
ight:16px;"><![endif]--><div style=3D"height:16px;" aria-hidden=3D"true"> &=
nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]--><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"c=
enter" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"border: sol=
id 1px #dadce0; border-radius: 8px; direction: rtl; font-size: 0; padding: =
24px 32px; text-align: left; vertical-align: top;" class=3D"main-container-=
inner"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation"><tr><![endif]--><div class=3D"" style=3D"font-=
size: 13px; text-align: left; direction: ltr; display: inline-block; vertic=
al-align: top; width: 100%;overflow: hidden; word-wrap: break-word;"><table=
 border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" wid=
th=3D"100%" class=3D"main-column-table-ltr" style=3D"padding-right: 32px; p=
adding-left: 0;;table-layout: fixed;"><tbody><tr><td class=3D"main-column-t=
d" style=3D"padding:0; vertical-align:top;"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%" style=3D"tabl=
e-layout: fixed;"><tr><td style=3D"font-size: 0; padding: 0; text-align: le=
ft; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-family=
: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14px;=
 line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: =
none;" class=3D"primary-text" role=3D"presentation"><span>Please contact us=
 on whats app +48 531379837 We would like to get a bit more information abo=
ut what you provide, because we are interested in long term and we can orde=
r a lot</span><meta itemprop=3D"description" content=3D"Please contact us o=
n whats app +48 531379837 We would like to get a bit more information about=
 what you provide, because we are interested in long term and we can order =
a lot"/></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-ali=
gn: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-=
family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size:=
 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decora=
tion: none;" class=3D"primary-text" role=3D"presentation"><span aria-hidden=
=3D"true"><time itemprop=3D"startDate" datetime=3D"20250804"></time><time i=
temprop=3D"endDate" datetime=3D"20250805"></time></span><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding=
-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;=
color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothi=
ng: antialiased;margin: 0; padding: 0;">When</h2></td></tr></table><span>Mo=
nday Aug 4, 2025</span></div></td></tr><tr><td style=3D"font-size: 0; paddi=
ng: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><div=
 style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight: =
400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c40=
43; text-decoration: none;" class=3D"primary-text" role=3D"presentation"><t=
able border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"=
 style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D=
"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;-we=
bkit-font-smoothing: antialiased;margin: 0; padding: 0;">Organizer</h2></td=
></tr></table><div style=3D"color: #3c4042;"><span class=3D"notranslate"><a=
 class=3D"primary-text underline-on-hover" style=3D"display: inline-block;;=
color: #3c4043; text-decoration: none;" href=3D"mailto:addilynconley3@eduma=
chali.cl">Addilyn Conley3</a></span><span itemprop=3D"organizer" itemscope =
itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"Ad=
dilyn Conley3"/><meta itemprop=3D"email" content=3D"addilynconley3@edumacha=
li.cl"/></span></div><div style=3D"color: #707579;"><a class=3D"secondary-t=
ext underline-on-hover" style=3D"display: inline-block;;color: #70757a; tex=
t-decoration: none;" href=3D"mailto:addilynconley3@edumachali.cl">addilynco=
nley3@edumachali.cl</a></div></div></td></tr><tr><td style=3D"font-size: 0;=
 padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;=
"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-we=
ight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color:=
 #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentati=
on"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"present=
ation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" st=
yle=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 7=
00;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Guests</h2><=
/td></tr></table>(Guest list has been hidden at organizer's request)</div><=
/td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-=
break: break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; text-=
decoration: none;;font-family: Roboto, sans-serif;font-size: 14px; line-hei=
ght: 20px; mso-line-height-rule: exactly; text-align: left;" class=3D"prima=
ry-text"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: antia=
liased;">Reply</span><span class=3D"secondary-text" style=3D"color: #70757a=
; text-decoration: none;"> for <a class=3D"secondary-text underline-on-hove=
r" style=3D"display: inline-block;;color: #70757a; text-decoration: none;" =
href=3D"mailto:linux-firmware@kernel.org">linux-firmware@kernel.org</a></sp=
an></div></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-al=
ign: left; word-break: break-word;;padding-bottom:16px;"><div style=3D"font=
-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-he=
ight-rule: exactly; text-align: left;"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation" style=3D"border-collapse: separat=
e;"><tr><td style=3D"padding-top: 8px; padding-left: 0; padding-right: 12px=
;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-rad=
ius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;;display: inline-block;;margin-right: 12px; margin-left: 0=
;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presentation"=
><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org=
/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/Rsv=
pAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"http://s=
chema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schem=
a.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"ht=
tps://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNnBzcmF=
ndmY0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D1=
&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlNGM4ZTZm=
ZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=
=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto,=
 sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-he=
ight-rule: exactly; margin: 0; text-decoration: none; text-transform: none;=
" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td =
align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: =
6px 0; padding-left: 16px; padding-right: 12px; white-space: nowrap;"><!--[=
if mso]><a href=3D"https://calendar.google.com/calendar/event?action=3DRESP=
OND&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2Vyb=
mVsLm9yZw&amp;rst=3D1&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGN=
jYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FPar=
is&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" targ=
et=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-we=
ight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f=
6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; ma=
rgin: 0; text-decoration: none; text-transform: none;">Yes</span><!--[if ms=
o]></a><![endif]--></td></tr></table></a></span></span></span></td><td alig=
n=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D"borde=
r-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"=
/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAc=
tionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReques=
tMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk=
1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D2&amp;tok=3DMjgjY=
WRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcx=
NzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"f=
ont-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;colo=
r: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exact=
ly; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-=
button-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center"=
 role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 12px; white-=
space: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calenda=
r/event?action=3DRESPOND&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3YgbGlu=
dXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;rst=3D2&amp;tok=3DMjgjYWRkaWx5bmNvbmxleT=
NAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&a=
mp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" =
itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-t=
ext" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, =
sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-hei=
ght-rule: exactly; margin: 0; text-decoration: none; text-transform: none;"=
>No</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></span>=
</span></td><td align=3D"center" vertical-align=3D"middle" role=3D"presenta=
tion"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schem=
a.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.or=
g/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"h=
ttp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:=
//schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a hre=
f=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3D=
NnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;=
rst=3D3&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlN=
GM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FParis&amp;hl=3Den=
&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-=
line-height-rule: exactly; margin: 0; text-decoration: none; text-transform=
: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><tab=
le border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><=
tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"pa=
dding: 6px 0; padding-left: 12px; padding-right: 16px; white-space: nowrap;=
"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcm=
VAa2VybmVsLm9yZw&amp;rst=3D3&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWFjaGFs=
aS5jbGNjYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3DEurop=
e%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"ur=
l" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"=
font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;col=
or: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exac=
tly; margin: 0; text-decoration: none; text-transform: none;">Maybe</span><=
!--[if mso]></a><![endif]--></td></tr></table></a></span></span></span></td=
></tr></table><!-- More options --><a href=3D"https://calendar.google.com/c=
alendar/event?action=3DVIEW&amp;eid=3DNnBzcmFndmY0dW9qMjFndDk1cWM0MWMxa3Ygb=
GludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMjgjYWRkaWx5bmNvbmxleTNAZWR1bWF=
jaGFsaS5jbGNjYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcxNzdjMWM4MWY2Yjc&amp;ctz=3D=
Europe%2FParis&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font=
-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: =
#5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly;=
 margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-but=
ton-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-r=
adius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" rol=
e=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-rig=
ht: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNnBzcmFndmY=
0dW9qMjFndDk1cWM0MWMxa3YgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw&amp;tok=3DMjgjY=
WRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbGNjYWNlOWJiYWRlNGM4ZTZmZDViNjBjMWU4OTcx=
NzdjMWM4MWY2Yjc&amp;ctz=3DEurope%2FParis&amp;hl=3Den&amp;es=3D0" class=3D"g=
rey-button-text" target=3D"_blank"><![endif]--><span class=3D"grey-button-t=
ext" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, =
sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-hei=
ght-rule: exactly; margin: 0; text-decoration: none; text-transform: none;"=
>More options</span><!--[if mso]></a><![endif]--></td></tr></table></a></td=
></tr></table></div></td></tr></table></td></tr></tbody></table></div><!--[=
if mso | IE]></tr></table><![endif]--></td></tr></tbody></table><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D=
"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size=
: 0; padding: 0; text-align: left; word-break: break-word;;padding:4px 12px=
;" class=3D"" align=3D"left"><div class=3D"secondary-text" style=3D"color: =
#70757a; text-decoration: none;font-family: Roboto, sans-serif;font-size: 1=
2px; line-height: 16px; mso-line-height-rule: exactly; text-align: left;"><=
p>Invitation from <a href=3D"https://calendar.google.com/calendar/" class=
=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, sans-seri=
f;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;color:=
 #1a73e8; text-decoration: none;" target=3D"_blank">Google Calendar</a></p>=
<p>You are receiving this email because you are an attendee on the event.</=
p><p>Forwarding this invitation could allow any recipient to send a respons=
e to the organizer, be added to the guest list, invite others regardless of=
 their own invitation status, or modify your RSVP. <a class=3D"accent-text =
underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12p=
x; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-d=
ecoration: none;" href=3D"https://support.google.com/calendar/answer/37135#=
forwarding">Learn more</a></p></div></td></tr></tbody></table></td></tr></t=
body></table></span></span></body></html>
--000000000000a1c1c3063b7dbf5b
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART;VALUE=DATE:20250804
DTEND;VALUE=DATE:20250805
DTSTAMP:20250803T224532Z
ORGANIZER;CN=Addilyn Conley3:mailto:addilynconley3@edumachali.cl
UID:6psragvf4uoj21gt95qc41c1kv@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=linux-firmware@kernel.org;X-NUM-GUESTS=0:mailto:linux-firmware@kern
 el.org
X-MICROSOFT-CDO-OWNERAPPTID:1264236291
CREATED:20250803T224529Z
DESCRIPTION:Please contact us on whats app +48 531379837 We would like to g
 et a bit more information about what you provide\, because we are intereste
 d in long term and we can order a lot
LAST-MODIFIED:20250803T224529Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Meeting                                        0xewrrmty7
TRANSP:TRANSPARENT
END:VEVENT
END:VCALENDAR

--000000000000a1c1c3063b7dbf5b--
--000000000000a1c1c4063b7dbf5d
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUO1ZBTFVFPURBVEU6MjAyNTA4MDQNCkRURU5EO1ZBTFVF
PURBVEU6MjAyNTA4MDUNCkRUU1RBTVA6MjAyNTA4MDNUMjI0NTMyWg0KT1JHQU5JWkVSO0NOPUFk
ZGlseW4gQ29ubGV5MzptYWlsdG86YWRkaWx5bmNvbmxleTNAZWR1bWFjaGFsaS5jbA0KVUlEOjZw
c3JhZ3ZmNHVvajIxZ3Q5NXFjNDFjMWt2QGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJ
VklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0K
IFRSVUU7Q049bGludXgtZmlybXdhcmVAa2VybmVsLm9yZztYLU5VTS1HVUVTVFM9MDptYWlsdG86
bGludXgtZmlybXdhcmVAa2Vybg0KIGVsLm9yZw0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElE
OjEyNjQyMzYyOTENCkNSRUFURUQ6MjAyNTA4MDNUMjI0NTI5Wg0KREVTQ1JJUFRJT046UGxlYXNl
IGNvbnRhY3QgdXMgb24gd2hhdHMgYXBwICs0OCA1MzEzNzk4MzcgV2Ugd291bGQgbGlrZSB0byBn
DQogZXQgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IHlvdSBwcm92aWRlXCwgYmVj
YXVzZSB3ZSBhcmUgaW50ZXJlc3RlDQogZCBpbiBsb25nIHRlcm0gYW5kIHdlIGNhbiBvcmRlciBh
IGxvdA0KTEFTVC1NT0RJRklFRDoyMDI1MDgwM1QyMjQ1MjlaDQpMT0NBVElPTjoNClNFUVVFTkNF
OjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6TWVldGluZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAweGV3cnJtdHk3DQpUUkFOU1A6VFJBTlNQQVJFTlQNCkVORDpW
RVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--000000000000a1c1c4063b7dbf5d--
