Return-Path: <SRS0=nueb=HE=broadcom.com=arend.vanspriel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05489C433DB
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Feb 2021 11:07:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CEE2E64E0F; Tue,  2 Feb 2021 11:07:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11E564E06
	for <linux-firmware@kernel.org>; Tue,  2 Feb 2021 11:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11E564E06
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arend.vanspriel@broadcom.com
Received: by mail-pf1-f178.google.com with SMTP id i63so14078332pfg.7
        for <linux-firmware@kernel.org>; Tue, 02 Feb 2021 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=2E4VpF/tqs6va/hhHnYl/eQMF6A0QMoD1vlPszJPzPg=;
        b=Nf8MoGNFTMfMwpzLupG52u0qxkSBrnQPe++dpJvm3HwISgUOyP6Yycl10o4h0UUZIW
         +N28xe/bYKr6laSkemvp7x3uCLJQtgp1FjpKjOn1ZV+W0vbD2o7Vy8xQPDiUJ+L0eHyi
         VLQM53R/LZHbB206X2+wkfLqvSpE85LkvUGk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=2E4VpF/tqs6va/hhHnYl/eQMF6A0QMoD1vlPszJPzPg=;
        b=lCSrLJNP3s8+vyVEhzM8GhA1f+kXsr7M5FDWvC5gmpgpjspWnUnFbXJh3x01vgq+M9
         eDAsStVupxUv92h6cJIViqTM2gz3AxR9nll6bTItUt8bQioxiK1Ux9nOSENafIaxxlDw
         a5ZhkOJEb3lw8pWH3+Zlql6qIBFr10O8iPuLTtNhOJbjUTSnlUTaFybn1Ae5WWJqEbny
         8d5dWQkOnaz+1e1Aqo2jWblfsh11hmYbIIcf9XZvszIJI08kY85df98eRe4R0nxm+n/Y
         DtGTpzTzIIW1gDzhsnjzDXEPlbCjNq23D14U73o/BcAX9vZUJ9fPIGKXGfELX+8r96xv
         VoIA==
X-Gm-Message-State: AOAM530dBgHXrCULZgX1i5rGM3WrM4DSNo+QKlVt3zygEx8aeTgRr8e6
	BZ2gZHrhMCnwjyc6i9m8j6piQzNea8N3s6wC6JOiD+WDhdxthNW5nhLcayIpunlqNHpeWSGh21m
	vgRQlatAJqcA=
X-Google-Smtp-Source: ABdhPJwwPgRi02iqyjCatfA7UgifqAt8xLs1QRr8Nt4CC4Liuxf5clX+6aWROIJDDGhZJqkk61f5oQ==
X-Received: by 2002:a62:ea14:0:b029:1bf:f580:3375 with SMTP id t20-20020a62ea140000b02901bff5803375mr20894919pfh.53.1612264062894;
        Tue, 02 Feb 2021 03:07:42 -0800 (PST)
Received: from [10.230.40.186] ([192.19.152.250])
        by smtp.gmail.com with ESMTPSA id r9sm12242903pfq.8.2021.02.02.03.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 03:07:41 -0800 (PST)
Subject: Re: [PULL 1/1] brcm: Add the brcmfmac43456-sdio.* files
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Linux Firmware <linux-firmware@kernel.org>,
 Franky Lin <franky.lin@broadcom.com>, phil@raspberrypi.org
References: <20210117074817.1721-1-alistair@alistair23.me>
 <20210117074817.1721-2-alistair@alistair23.me>
 <CA+5PVA52V5qZQb9q1jhdPoOxxX2ZV1tf3zFP9N1+qsBExe8dWw@mail.gmail.com>
 <CAKmqyKPmSUaZ0snyR1A8h1mbYdLUVkRre_=8gXPWO-GXF3s8FQ@mail.gmail.com>
 <23ee29eb-12e2-16ac-3a6d-aca40a652459@broadcom.com>
 <CA+5PVA7OKP4mQeWVRGLFYSXVH-gzqBTow6D0QoFveN1as7z_Jw@mail.gmail.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <b8a9d845-7289-190e-90ec-849d33721c7d@broadcom.com>
Date: Tue, 2 Feb 2021 12:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CA+5PVA7OKP4mQeWVRGLFYSXVH-gzqBTow6D0QoFveN1as7z_Jw@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c7035805ba587a29"

--000000000000c7035805ba587a29
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US

+ Phil Elwell

On 2/1/2021 4:14 PM, Josh Boyer wrote:
> On Tue, Jan 19, 2021 at 5:07 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 19-01-2021 17:47, Alistair Francis wrote:
>>> On Tue, Jan 19, 2021 at 3:55 AM Josh Boyer <jwboyer@kernel.org> wrote:
>>>>
>>>> On Sun, Jan 17, 2021 at 10:05 PM Alistair Francis
>>>> <alistair@alistair23.me> wrote:
>>>>>
>>>>> Add brcm/brcmfmac43456-sdio.bin, brcm/brcmfmac43456-sdio.clm_blob and
>>>>> brcm/brcmfmac43456-sdio.txt from the
>>>>> RaspberryPi debian package avaliable at:
>>>>> https://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/
>>>>
>>>> I'm confused.  Which package in there, and why is Debian carrying
>>>> firmware that isn't in the upstream linux-firmware tree?
>>>
>>> It's in the `firmware-brcm80211_20190114-1+rpt10_all.deb`. I'm not
>>> sure why it's there but not in linux-firmware.
>>
>> It is not provided by Debian, but by RPi foundation which provides it in
>> debian package. The URL kinda gives away why it is not in
>> linux-firmware: /firmware-nonfree/
>>
>> Also if you dive into the .deb file it has a copyright notice (attached)
>> which differs from the license that we have in linux-firmware for
>> Broadcom/Cypress firmware files.
> 
> Would it be possible for Broadcom to release the firmware themselves
> under a license permissible for linux-firmware?

Hi Josh,

Things get confusing for me, but it seems 43456 is a Synaptics chipset 
(now).

Regards,
Arend

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

--000000000000c7035805ba587a29
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
pra5sIx/TR6gNtLG9MpND9zQt5j42hInkP81vqu9DG8lovoPMuR0JVpFRbPjHZ07cLqqbFMVS/8z
53iSewIDAQABo4IB0zCCAc8wDgYDVR0PAQH/BAQDAgWgMIGeBggrBgEFBQcBAQSBkTCBjjBNBggr
BgEFBQcwAoZBaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NwZXJzb25hbHNp
Z24yc2hhMmczb2NzcC5jcnQwPQYIKwYBBQUHMAGGMWh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNv
bS9nc3BlcnNvbmFsc2lnbjJzaGEyZzMwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAw
RAYDVR0fBD0wOzA5oDegNYYzaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc3BlcnNvbmFsc2ln
bjJzaGEyZzMuY3JsMCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYD
VR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUaXKCYjFnlUSFd5GAxAQ2SZ17C2EwHQYDVR0O
BBYEFHAaaA+cRo3vYiA6aKVu1bOs4YAYMA0GCSqGSIb3DQEBCwUAA4IBAQCYLdyC8SuyQV6oa5uH
kGtqz9FCJC/9gSclQLM8dZLHF3FYX8LlcQg/3Ct5I29YLK3T/r35B2zGljtXqVOIeSEz7sDXfGNy
3dnLIafB1y04e7aR+thVn5Rp1YTF01FUWYbZrixlVuKvjn8vtKC+HhAoDCxvqnqEuA/8Usn7B0/N
uOA46oQTLe3kjdIgXWJ29JWVqFUavYdcK0+0zyfeMBCTO6heYABeMP3wzYHfcuFDhqldTCpumqhZ
WwHVQUbAn+xLMIQpycIQFoJIGJX4MeaTSMfLNP2w7nP2uLNgIeleF284vS0XVkBXSCgIGylP4SN+
HQYrv7fVCbtp+c7nFvP7MYICbzCCAmsCAQEwbTBdMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xv
YmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNI
QTI1NiAtIEczAgxR3m7Pj6LvQiWjJy0wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIE
IMyLzARIt/8pvD/jdc8iB/dl/JHA+Mm0IIflKJBNwLcTMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDIwMjExMDc0M1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgB
ZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQow
CwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQB2dLFIPiyRtqi0ZvcM
NWt/2aPOjfNL+WnGgxHpvePLagLaLdu6V71cLj9tSD34iEKnz8U4ZGfWvJc7hUlxLtRFgpdcQUKy
zak+X3o/u5a5hBQSme1I3PckpINfODUoAxXV7y21O58P/RwCMoRbozFncPlc5TiJnVDGu6DTF8p5
uUkKQGOk5Wi7tXobEm4JueUa/XLqxMDk4ZwIqr5V7fG+Fpsv6JIStl58OxoHj16bb+1gkEeUIOWV
fEHoPCP2Xudb87J/hx1g/DbsBB3z3+UVMmcF+lBb5EY+G4uVT7cc20DtOh9JuqAF6Azqkai5wIr7
KcvsbJ4XhWCt9ebA6rAk
--000000000000c7035805ba587a29--
