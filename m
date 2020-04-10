Return-Path: <SRS0=OEhx=52=gmail.com=sztsian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542E0C2BA2B
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Apr 2020 15:44:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4546B212CC; Fri, 10 Apr 2020 15:44:58 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2AA20679
	for <linux-firmware@kernel.org>; Fri, 10 Apr 2020 15:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJR+FxMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2AA20679
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=sztsian@gmail.com
Received: by mail-pj1-f66.google.com with SMTP id o1so49807pjs.4
        for <linux-firmware@kernel.org>; Fri, 10 Apr 2020 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=C5M7Q0aQiULpCQkYYcyQn47rch+aUqqKgk+eRJKHOXg=;
        b=nJR+FxMXjADXf5B6wNxx2Ok39Ii+YOj3I45R2BeYKyUEKoqfBmCbkkAzPT2CSdNfxP
         YOPvEPJSPU8/I8WMU7qEswVjaywUASD1EiV/BbXhbu82SWxIlAfkHf5w2EIneR/gTZAa
         ECNO0I73g9FyzFOjLSSklsKyP+a+ldxm1ePm1+nTVmI5v0B7oEBR8GDBy+nkjrBxe/Ya
         4n8VSGmT8NpEg6Qs6urZkdVGI8IfXsljqU5jdyL4429uSJn1waZUFxNd01C+1SNDSMxk
         UZX7F7Kt6KRLQLaTuSFZ0gj0uyz/Uhu1Q8uCGwwI/k79Y3vxCFqy98VkfrJ0p1cNJ7rV
         t7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=C5M7Q0aQiULpCQkYYcyQn47rch+aUqqKgk+eRJKHOXg=;
        b=PZ19o1W/fM9PT0sv3lerB8C/uzg6OCKDwJHshh75Si5Qr6KsECmk9eB4ac3o/usE/F
         sOlVjDfpj7GgxjL6Wd4JhAkDglh1gTu6dBD6KFlQhAgbr6naB/0SNX2i+9Mpg/v9M4IJ
         7C6O/PYT8aN7Yd7xy7LbnzC6J4gIcTIbAbW9hdtvhU+Z93DnMiyP3uC7N6gD7qxU4TM3
         piM4jTH+ljLNBqszJ9CiOCJ4rTArSVptwetZQkwlBARHEMToKNhJUfZ3uJJxcV5s2CD8
         bzvd0cyfZ2BvEIhGxwgSogPXK+BRbWa5dFn0uFuihGHgJiGj3KadCregJuM7DC97n1bn
         Khkg==
X-Gm-Message-State: AGi0PuZwvAzEM+xCBXvRMX7aZNCHXM27QkVP729bvDOBvTtTM8Ou6C/e
	N456eHMu5WXbRMf+UBtO/GmJoPsj75s=
X-Google-Smtp-Source: APiQypJOO/5uQyBRISlCg9tWYK4VwEqD7AKP0cvbfG6XQv/TukWU1/xzTRog9R0XzcbY881QmdJnqw==
X-Received: by 2002:a17:902:eb13:: with SMTP id l19mr5222853plb.156.1586533497487;
        Fri, 10 Apr 2020 08:44:57 -0700 (PDT)
Received: from i7.zsun.org ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id b16sm2053855pfb.71.2020.04.10.08.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 08:44:56 -0700 (PDT)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Zamir SUN <sztsian@gmail.com>
Subject: Question about rtl8761b Realtek bluetooth dongle firmware
Cc: sztsian@gmail.com
Message-ID: <4bb6d05c-b6b6-f8c8-3a49-f76cd129c665@gmail.com>
Date: Fri, 10 Apr 2020 23:44:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Recently I purchased a unbranded USB Bluetooth dongle which is found not 
supported by Linux yet. And the vendor declare it to have rtl8716b chip. 
After playing with it for a while we've figured out that it's mostly 
compatible with the btrtl driver, with the difference firmware needed. 
We found the firmware from the Windows driver CD shipped along with the 
dongle and confirmed it works in Linux. I've carefully checked the 
Windows driver as well as the installer and did not see any EULA. As I 
don't work for Realtek, neither the producer of this USB dongle, so I am 
writing to ask if I can submit to linux-firmware?

The patch to the driver is already sent out
https://patchwork.kernel.org/patch/11483367/

Thanks in advance.
-- 
Zamir SUN
Fedora user
GPG : 1D86 6D4A 49CE 4BBD 72CF FCF5 D856 6E11 F2A0 525E
