Return-Path: <SRS0=BiOw=6S=gmail.com=shreyashcebola@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A75D44164
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Dec 2025 10:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5B3DC4CEF5; Fri, 12 Dec 2025 10:28:14 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7934C4CEF1
	for <linux-firmware@kernel.org>; Fri, 12 Dec 2025 10:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7934C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so863090137.2
        for <linux-firmware@kernel.org>; Fri, 12 Dec 2025 02:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765535292; x=1766140092; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wQefynb0pPe/bYcfCBx/f3/7N0PJucGOik+jHyXJYxU=;
        b=M9/4T2KbY6a1U5VOs1KoxyoryeXY40QNd+Vzy4hd+cfl+oo0zTKLEcuUVJsT8/xLo+
         9eU0cjVNriZ9T3dYFNufXee9rq/vehV0ncqV0ihbTpKpamGclT02m9wLCMQhPxvarNpH
         nH0oQGChW3mjwj80vsPUnqZIypFwgVKeGdI+8fjFqE1QaQrufXJKq1AkzaUnjLNd7HnA
         oy1Z+kaN1S7Fu08EacYudYj1eaV03KEWboo3CaoDlH6r2PtIQ5XATZ6B71T9nVvHHYkz
         aYTJMruckDWIgWZCYPr22pzloGwAkgOQj+TaMF0+59vNVH7NXVFCtI85AwgXH2KOu2Dj
         u1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535292; x=1766140092;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQefynb0pPe/bYcfCBx/f3/7N0PJucGOik+jHyXJYxU=;
        b=JQxu6UXXXaJKb8IN6L174nr9MPgyb3nttAJstBvcWyhO0udZJ8KZ4qrhgc4Y2YM2qa
         er1Dry0fk8Sv/GnJPZF18WcyA5q9JUjkBul1k/Ml9Ao+U98G8JCaj7DEGY0rHrRmrSdv
         ynW3HXt3Tl/ZVq/7PGwQe6YvYyy/EVz2XZ8AfbBpxaIPRRKg2Jo35f5L0JxM/7v8H6cd
         4G75Gzssjkujar7kaUj26KZMbdzGvz82+OAG1qdNin/9jJe51biwVn79hW2Ilm7HIuDR
         +dX9BFzenovlyxBZ2lz1VVWDGXi5nCOoGNB3M1Q2G0uEav9j2+CkYWfwpOjN04QvKr8O
         6lNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZnLpfviwS/r0FfU5oJBtWXfpQAkqm2KXvqQNdifCU9F87lv8qmXfC51RKg6xFEtwOSz99LHVmFrCZPwbJg==@kernel.org
X-Gm-Message-State: AOJu0Yyj8DXzPCY5o7f6Dln4MSCoIcOGvqA825ZGL6PN0YGzKeLSOz5v
	dIdTWMLjHq7HnA3GFbMimr55xasrRQ1Ky7VQV+Fd6carYVTbZkNBzmz3WPL2lITD1TBbt+1FywA
	aGvxzVyd4rOT7VTi0yFSB/bpT7i0dROY=
X-Gm-Gg: AY/fxX6FjG4j8nCi0VWeXSvZLc4Wgjas2T3ViUEzx5TMIygBuY9gs0te82qm+FRMT03
	l8ngdTcGeXEg8ORgxKBcCiEt7qxGnadCHCQjVPexYAPC6SjpW8+4xi1R3/QL06EUkruNnF30oIB
	VSlSYrTZaj/ch093aCtPTkhG+g63Hds8CqV+xzqVJCQjkuiJJCD+wWdnb6/z7F36kYg/HjlZlnr
	KQDVmxhYhcJcxZNIAx54wGPcbklJX/DwJ6WYP/j34HePOvp53UV1yza5+vCmU2MfPcXuJ4RC9Nr
	2INYRbTUC2AnBI2mSLqsblAKOwY=
X-Google-Smtp-Source: AGHT+IEATZXH8ApR1EBYCsXyFQgUIARQQVnor8vASJBjzkVCbbq0cCeTMl4rQeK1vKvOhsGipb3V2skvuAG+e1F8ysY=
X-Received: by 2002:a05:6102:f9c:b0:5db:fddb:3155 with SMTP id
 ada2fe7eead31-5e82768c12fmr378318137.17.1765535291692; Fri, 12 Dec 2025
 02:28:11 -0800 (PST)
MIME-Version: 1.0
From: Shreyash Chaurasia <shreyashcebola@gmail.com>
Date: Fri, 12 Dec 2025 15:58:00 +0530
X-Gm-Features: AQt7F2rTd6ovey-l7ORmn-j54bAEJokYR9bgbAhWb-1ZT34MRrhfw2QWm1wa2JI
Message-ID: <CAP+hjTUaBeVm9GPmbDUhCMXZJ-y=f8k+whr1EjS=NF5NWZ_upg@mail.gmail.com>
Subject: =?UTF-8?Q?Request_for_Missing_Bluetooth_Firmware_for_Realtek_D?=
	=?UTF-8?Q?evice_=28VID_13D3_=2F_PID_3612_=E2=80=94_RTL8852CE=29?=
To: support@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: service@imcnl.com.tw, contact_in@asus.com, support@asus.com, 
	linux-firmware@kernel.org
Content-Type: multipart/mixed; boundary="000000000000e687cb0645beb736"

--000000000000e687cb0645beb736
Content-Type: multipart/alternative; boundary="000000000000e687b90645beb734"

--000000000000e687b90645beb734
Content-Type: text/plain; charset="UTF-8"

Dear Realtek Support Team,

I am writing to request assistance with missing Linux firmware for a
Realtek-based Bluetooth device used in my ASUS laptop (System Model: ASUS
TUF Gaming F16 FX608JH_FX608JH).
The device details are:

   -

   *Vendor ID:* 13D3
   -

   *Product ID:* 3612
   -

   *Reported Manufacturer:* Realtek
   -

   *Chipset Family:* RTL8852CE (WiFi + BT combo)

On Linux, the Bluetooth controller is detected by the btusb driver, but the
firmware does not load correctly. This results in the Bluetooth stack
failing to initialize with the following critical error:

Bluetooth: hci0: Failed to read codec capabilities (-22)

The official Linux firmware repository does not contain firmware files for
this device (such as rtl8852b_fw.bin, rtl8852b_config.bin, or equivalent
for the 13d3:3612 module).
Because of this, Bluetooth cannot function on Linux systems.
RequestPlease provide the correct Bluetooth firmware binaries for this
device,

OR submit the appropriate firmware to the official *linux-firmware*
repository.

I am happy to test any firmware you provide and share detailed logs.

The diagnostics summary is attached below for your reference.

Thank you for your assistance,
*Shreyash Chaurasia*

--000000000000e687b90645beb734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Dear Realtek Support Team,</p><p>I am writing to reques=
t assistance with missing Linux firmware for a Realtek-based Bluetooth devi=
ce used in my ASUS laptop (System Model: ASUS TUF Gaming F16 FX608JH_FX608J=
H).<br>
The device details are:</p><ul>
<li>
<p><strong>Vendor ID:</strong> 13D3</p>
</li>
<li>
<p><strong>Product ID:</strong> 3612</p>
</li>
<li>
<p><strong>Reported Manufacturer:</strong> Realtek</p>
</li>
<li>
<p><strong>Chipset Family:</strong> RTL8852CE (WiFi + BT combo)</p>
</li>
</ul><p>On Linux, the Bluetooth controller is detected by the <code>btusb</=
code> driver, but the firmware does not load correctly. This results in the=
 Bluetooth stack failing to initialize with the following critical error:</=
p><pre class=3D"gmail-overflow-visible! gmail-px-0!"><div class=3D"gmail-co=
ntain-inline-size gmail-rounded-2xl gmail-corner-superellipse/1.1 gmail-rel=
ative gmail-bg-token-sidebar-surface-primary"><div class=3D"gmail-sticky gm=
ail-top-9"><div class=3D"gmail-absolute end-0 gmail-bottom-0 gmail-flex gma=
il-h-9 gmail-items-center gmail-pe-2"><div class=3D"gmail-bg-token-bg-eleva=
ted-secondary gmail-text-token-text-secondary gmail-flex gmail-items-center=
 gmail-gap-4 gmail-rounded-sm gmail-px-2 gmail-font-sans gmail-text-xs"></d=
iv></div></div><div class=3D"gmail-overflow-y-auto gmail-p-4" dir=3D"ltr"><=
code class=3D"gmail-whitespace-pre!"><span class=3D"gmail-hljs-symbol">Blue=
tooth:</span> hci0: Failed <span class=3D"gmail-hljs-keyword">to</span> rea=
d codec capabilities (-<span class=3D"gmail-hljs-number">22</span>)
</code></div></div></pre><p>The official Linux firmware repository does not=
 contain firmware files for this device (such as <code>rtl8852b_fw.bin</cod=
e>, <code>rtl8852b_config.bin</code>, or equivalent for the 13d3:3612 modul=
e).<br>
Because of this, Bluetooth cannot function on Linux systems.</p><h3><font s=
ize=3D"2" style=3D"">Request</font></h3><h3><span style=3D"font-size:small;=
font-weight:normal">Please provide the correct Bluetooth firmware binaries =
for this device,</span></h3><p>
OR submit the appropriate firmware to the official <strong>linux-firmware</=
strong> repository.</p><p>I am happy to test any firmware you provide and s=
hare detailed logs.</p><p>The diagnostics summary is attached below for you=
r reference.</p><p>









</p><p>Thank you for your assistance,<br>
<strong>Shreyash Chaurasia</strong></p></div>

--000000000000e687b90645beb734--
--000000000000e687cb0645beb736
Content-Type: text/plain; charset="UTF-8"; name="report.txt"
Content-Disposition: attachment; filename="report.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mj2q3cbo0>
X-Attachment-Id: f_mj2q3cbo0

RGlhZ25vc3RpYyBTdW1tYXJ5Og0KDQoxLiBsc3VzYg0KQnVzIDAwMSBEZXZpY2UgMDA1OiBJRCAx
M2QzOjM2MTIgSU1DIE5ldHdvcmtzIEJsdWV0b290aCBSYWRpbw0KaU1hbnVmYWN0dXJlcjogUmVh
bHRlaw0KaVByb2R1Y3Q6IEJsdWV0b290aCBSYWRpbw0KDQoyLiBkbWVzZyBlcnJvcnMNCkJsdWV0
b290aDogaGNpMDogRmFpbGVkIHRvIHJlYWQgY29kZWMgY2FwYWJpbGl0aWVzICgtMjIpDQp1c2Jj
b3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGJ0dXNiDQpIQ0kgZGV2aWNlIGRl
dGVjdGVkIGJ1dCBmaXJtd2FyZSBmYWlscyB0byBpbml0aWFsaXplDQoNCjMuIEtlcm5lbCB2ZXJz
aW9uDQpMaW51eCA2LjE3LjExLXg2NHYyLXhhbm1vZDEgKGFsc28gZmFpbGVkIG9uIHN0b2NrIEth
bGkga2VybmVsIDYuMTEpDQoNCjQuIEZpcm13YXJlIGZvbGRlciBjb250ZW50cw0KDQovbGliL2Zp
cm13YXJlL3J0bF9idC8gY29udGFpbnMgbWFueSBSZWFsdGVrIGZpbGVzIChydGw4NzIzLCBydGw4
ODIxLCBydGw4ODUyY3UsIHJ0bDg4NTJidSwgZXRjLikNCmJ1dCBubyBmaXJtd2FyZSBmb3IgcnRs
ODg1MmIgLyBydGw4ODUyYmUgLyBydGw4ODUyY2UuDQoNCjUuIEJsdWV0b290aCBzdGF0ZQ0KYmx1
ZXRvb3RoY3RsIHNjYW4gb24g4oaSIFNldERpc2NvdmVyeUZpbHRlciBmYWlsZWQ6IG9yZy5ibHVl
ei5FcnJvci5Ob3RSZWFkeQ==
--000000000000e687cb0645beb736--
