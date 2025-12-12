Return-Path: <SRS0=BiOw=6S=gmail.com=shreyashcebola@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9DED44166
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Dec 2025 10:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DD9CC4CEF5; Fri, 12 Dec 2025 10:53:14 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3677BC4CEF1
	for <linux-firmware@kernel.org>; Fri, 12 Dec 2025 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3677BC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f4f04d9f6so634953241.0
        for <linux-firmware@kernel.org>; Fri, 12 Dec 2025 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765536792; x=1766141592; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pwGpgrRqzA/h/Evb2JWv1FBLZc6p5cRKXfnZEv854nw=;
        b=JPcgBmd7Uqluv2S2uGWfgX2hF2W67vNEjaVNNkUMLZ/Z2ZAPHEBv2txOEvqVugcOpL
         gQAfc2OkurXM8GgZYF8wCc7QGcPI1GhoSgsT8aS8dOwB+IkcE12fksaExE22vBCrCsIP
         RVirUTuqxcpKvVI/hTsw8QF9HuWVZu1Pw/2zFLl/LIjs9wAUvbatJIy0/2e2bcTTAW9v
         O9lrgZlTO+fGL2b25xKrxup/GZQfqS/Cif3AjZAYYivgud4bUC31ekEgvKzgTz9RMLsy
         DJWC2KfnUrrTiSMCfKu2m3Ttt1ENLe/w91BmhNCtIzdGw+TqXAipJe2jVeRlGnhN+Jqr
         gXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765536792; x=1766141592;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwGpgrRqzA/h/Evb2JWv1FBLZc6p5cRKXfnZEv854nw=;
        b=jP93b8w0e4UFYs7egqxTnSTX31ij4p5a5VSuTQ4XdHMYRey9/ksPIJ3aOyOlnfFVmJ
         N/+zkeHvTmZnox017OvscZ7MiSQVWOUiuRM4GcDT8jC5dne289VnuKlX7qx9QMys81Sv
         Di3J5fNx5gixkQXOMCBUtqvaLNa/mmumlMagMp2skHZbqZZa2xeAQkfj6ofGU1Ie8Bbw
         U+fat4GMdTBSku1XV6hOphfNfT/MZf0HFI5sFtfG8p67zXUukhLgk1w5G/NVQIuRgwOC
         o4HPT0z7Y2O53PDUKzn7gDeUp1raGBA1Iv+w4b7dkYqgoNKgY9V3yjkJLQABfF3usIch
         VpIA==
X-Gm-Message-State: AOJu0Yw/qyCuLJJV3bcpfkSg6IdhNNs+Td2pZz+PUjdvqM+y0a93GBoF
	MOwULcl9LdZJwKEgSYDPAO+FFZMfdV7Y68BhcuOuxpnjpqctgExBt7rMhSm+5fjkdTYmfizcFxv
	cFjBLHNk7dWgdYOExxblpoA+qPA6ZIa4=
X-Gm-Gg: AY/fxX5Ktj+eXKuEPvrk1Sba4gUgdQI3JCPmEQVslttfB02Jxsqh+BnykYbHGcGQZra
	XC+XVOXI0J8WIkDYKrSkZbpZQSx7l6IEEU8rOofU7gIXgqV8ZD40YOQzt6J2ZdXRQtWR2CbA8tB
	mteVUC3C7bQPNaGsonEpiv4nB19GM2MnPWJl0S6Mdpz0OThHqolPRMNqXSEXk7yxKV39daGA6HP
	l1g9SggN0/AAqNMfpSmtjsWwWtSiU8iZYKxtEAi76DxUVueIVHnEjP2LY1YuKsHDaGZWHlVOC5L
	se3MfhbtHs0OzWaWu8Iv5NE9sqE=
X-Google-Smtp-Source: AGHT+IHiiv8Xi9ZkyNySjepV4/iJJc2CnjhjhIAnJZ30GohssKf5CrHUF8wtoxgBXISTGYQlEdojAvxxYIR5AYPgVV4=
X-Received: by 2002:a05:6102:4194:b0:5db:e2f8:cf35 with SMTP id
 ada2fe7eead31-5e811585140mr1957050137.3.1765536792025; Fri, 12 Dec 2025
 02:53:12 -0800 (PST)
MIME-Version: 1.0
From: Shreyash Chaurasia <shreyashcebola@gmail.com>
Date: Fri, 12 Dec 2025 16:23:00 +0530
X-Gm-Features: AQt7F2ouFvXMJwDhPaxHShjA1DZmRf5IJDr0CWZhqEtJY-zb86ey3Kyuu-XoIfk
Message-ID: <CAP+hjTVEJfm2O7ZHdShKCzXKGJhZaeZVWQMb24a51JR=r973Jg@mail.gmail.com>
Subject: =?UTF-8?Q?Request_for_Updated_Bluetooth_Firmware_for_ASUS_Lapt?=
	=?UTF-8?Q?op_=28Realtek=2FIMC_Networks_=E2=80=93_USB_ID_13d3=3A3612=29?=
To: asusindia_cs@asus.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, support@imcnetworks.com
Content-Type: multipart/mixed; boundary="00000000000053d1c40645bf11e0"

--00000000000053d1c40645bf11e0
Content-Type: multipart/alternative; boundary="00000000000053d1c20645bf11de"

--00000000000053d1c20645bf11de
Content-Type: text/plain; charset="UTF-8"

Hello Team,

I am writing to request assistance regarding a Bluetooth issue on my ASUS
laptop when running Linux.
*Device Information*

   -

   *Vendor:* IMC Networks
   -

   *Chipset:* Realtek (identified via lsusb)
   -

   *USB ID:* *13d3:3612*
   -

   *Laptop Brand:* ASUS
   -

   *System Model:* ASUS TUF Gaming F16 FX608JH_FX608JH
   -

   *Operating System:* Linux (Kernel 6.17+, XanMod & stock kernels tested)

*Issue Description*

The Bluetooth adapter powers on, but Linux reports the following error:

Bluetooth: hci0: Failed to read codec capabilities (-22)

Because of this, Bluetooth scanning and pairing do not work at all.

It appears that the required Realtek Bluetooth firmware for this device may
be *missing or incomplete* in the current Linux linux-firmware package.
Several attempts to load newer firmware resulted in the same error.
*Request*

Could you please help with:

   1.

   Providing the *correct firmware files* for the Bluetooth module
   *13d3:3612*,
   *or*
   2.

   Confirming whether ASUS/IMC Networks can release the necessary firmware
   to the Linux community so it can be included in the upstream
   linux-firmware repository.

The diagnostics summary is attached below for your reference.

I can also provide additional logs (e.g., btmon traces) if needed.

Thank you for your time and support. I hope to help improve Linux
compatibility for this Bluetooth module.

Best regards,
*Shreyash Chaurasia*

--00000000000053d1c20645bf11de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello Team,</p>
<p>I am writing to request assistance regarding a Bluetooth issue on my ASU=
S laptop when running Linux.</p>
<h3><strong><font size=3D"2">Device Information</font></strong></h3>
<ul>
<li>
<p><strong>Vendor:</strong> IMC Networks</p>
</li>
<li>
<p><strong>Chipset:</strong> Realtek (identified via lsusb)</p>
</li>
<li>
<p><strong>USB ID:</strong> <strong>13d3:3612</strong></p>
</li>
<li>
<p><strong>Laptop Brand:</strong> ASUS</p>
</li><li><p><b>System Model:</b>=C2=A0ASUS TUF Gaming F16 FX608JH_FX608JH<b=
r></p></li>
<li>
<p><strong>Operating System:</strong> Linux (Kernel 6.17+, XanMod &amp; sto=
ck kernels tested)</p>
</li>
</ul>
<h3><strong><font size=3D"2">Issue Description</font></strong></h3>
<p>The Bluetooth adapter powers on, but Linux reports the following error:<=
/p>
<pre class=3D"gmail-overflow-visible! gmail-px-0!"><div class=3D"gmail-cont=
ain-inline-size gmail-rounded-2xl gmail-corner-superellipse/1.1 gmail-relat=
ive gmail-bg-token-sidebar-surface-primary"><div class=3D"gmail-sticky gmai=
l-top-9"><div class=3D"gmail-absolute end-0 gmail-bottom-0 gmail-flex gmail=
-h-9 gmail-items-center gmail-pe-2"><div class=3D"gmail-bg-token-bg-elevate=
d-secondary gmail-text-token-text-secondary gmail-flex gmail-items-center g=
mail-gap-4 gmail-rounded-sm gmail-px-2 gmail-font-sans gmail-text-xs"></div=
></div></div><div class=3D"gmail-overflow-y-auto gmail-p-4" dir=3D"ltr"><co=
de class=3D"gmail-whitespace-pre!"><span class=3D"gmail-hljs-symbol">Blueto=
oth:</span> hci0: Failed <span class=3D"gmail-hljs-keyword">to</span> read =
codec capabilities (-<span class=3D"gmail-hljs-number">22</span>)
</code></div></div></pre>
<p>Because of this, Bluetooth scanning and pairing do not work at all.</p>
<p>It appears that the required Realtek Bluetooth firmware for this device =
may be <strong>missing or incomplete</strong> in the current Linux <code>li=
nux-firmware</code> package. Several attempts to load newer firmware result=
ed in the same error.</p>
<h3><strong><font size=3D"2">Request</font></strong></h3>
<p>Could you please help with:</p>
<ol>
<li>
<p>Providing the <strong>correct firmware files</strong> for the Bluetooth =
module <strong>13d3:3612</strong>,<br>
<strong>or</strong></p>
</li>
<li>
<p>Confirming whether ASUS/IMC Networks can release the necessary firmware =
to the Linux community so it can be included in the upstream <code>linux-fi=
rmware</code> repository.</p>
</li>
</ol>
<h3><span style=3D"font-weight:normal"><font size=3D"2">The diagnostics sum=
mary is attached below for your reference.</font></span></h3>
<p>I can also provide additional logs (e.g., <code>btmon</code> traces) if =
needed.</p>
<p>Thank you for your time and support. I hope to help improve Linux compat=
ibility for this Bluetooth module.</p>
<p>Best regards,<br>
<strong>Shreyash Chaurasia</strong></p></div>

--00000000000053d1c20645bf11de--
--00000000000053d1c40645bf11e0
Content-Type: text/plain; charset="UTF-8"; name="report.txt"
Content-Disposition: attachment; filename="report.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mj2qnpn60>
X-Attachment-Id: f_mj2qnpn60

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
--00000000000053d1c40645bf11e0--
