Return-Path: <SRS0=QpnV=SG=gmail.com=andrej.skvortzov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D90D2E9E3
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Nov 2024 12:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6A14C4CED5; Mon, 11 Nov 2024 12:30:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C70F1C4CECF
	for <linux-firmware@kernel.org>; Mon, 11 Nov 2024 12:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C70F1C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53c779ef19cso5224488e87.3
        for <linux-firmware@kernel.org>; Mon, 11 Nov 2024 04:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731328254; x=1731933054; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IR3LUfIdbzn0NOxsSi97eOUNl5yuMQyeJb0GeRi6HjE=;
        b=V+TLtOz00TPN6lZnAUPlUpt/ZMIIqtysZtUIF0GQiKR7rW6WE7CZPtQSeWSxX0YzkJ
         EfVSsJDE749FOIyxXielRGBvqNo+BLk6eMRHyE/FlrkYAXTBCybawo3FfbPbi/vnRN9T
         WZu6k9gq+pBe16XrXmdnMBn4XMIougW9tP76OAIiAJTNDYftnCa+OMr+hHtYYosCL39r
         VJL1Qp10SfIk72FxTjT42j4x1FixDh3BE6+tKbd4UsrHIBgLJVb7+xuFjRrfTJnTu22F
         NVsKeCEvJ8PtkbGPb47O4FOFb99ynCxaf1H19xokqR3JpoQ3oWqMQ6kFhtPDM8YWUUUe
         Jhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731328254; x=1731933054;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IR3LUfIdbzn0NOxsSi97eOUNl5yuMQyeJb0GeRi6HjE=;
        b=iFZYFd3wdvGqcfqaUNgZBk+vj4NUWwanFru3dbMROHZMp5WlhQ2mFVFlxN5YOYnOmH
         u5+uoIp2dmW9YYKxIC0g50HUZb21au/rgTjhPZhQp2K4wTJVAYEsRkIK/tIkKf8TXgoY
         KEQZZAKYu1CfBtNgDhuxcZmIG80GMYl7+rKv2kRa/qR68tP8oYDo/b7j2m5COuzo+0BW
         6HkYljTt0hjMD2oPcF5j/PR8nqu1ZxE6Clt2SrnRXAYh6npu0fFKDOAiLT825UeSKFYV
         k4/v58wrTthUjKc+KJX0ceT3TyC+Ge3PE//pokkYK488sITxCGHhyUO8K+0INGHeoI70
         2axA==
X-Gm-Message-State: AOJu0YwF4V5LscoVMNYpi145tLacM0Wwe/59lcwIqOkqWmYxWJc4odMc
	YZvuJZU9ANqU33NYjy895yy81/IbAfjmFhr7wyMPm4HZAlXPM6g+9ZE7Uw==
X-Google-Smtp-Source: AGHT+IGo23SqsFPj0Ah2QnBtolAh5VjENlhk0TOFfP2MpJJdznMx7ob546obriI7jkXIzhDU+s87zw==
X-Received: by 2002:a05:651c:881:b0:2fb:628c:2580 with SMTP id 38308e7fff4ca-2ff201e6d03mr62336311fa.2.1731328253950;
        Mon, 11 Nov 2024 04:30:53 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17901111sm16633691fa.54.2024.11.11.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 04:30:53 -0800 (PST)
Date: Mon, 11 Nov 2024 15:30:53 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Peter Robinson <pbrobinson@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: RTL8723CS not usable with config from RTL8723BS on PinePhone
Message-ID: <ZzH4_ZtpFbx-Z_49@skv.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

commit 'rtl_bt: Add firmware file for the the RTL8723CS Bluetooth
part' [1] has added firmware and configuration file for RTL8723CS. After
switching to it I've noticed, that Bluetooth is only partially
working. 'bluetoothctl show' displays information about controller,
but neither scans, nor connection to external devices work. That was
tested with unpatched Linux kernel v6.12-rc6 and rc7 on PinePhone.

Previously I had working BT with firmware from [2]. I've tried to
investigate the problem using rtlfw tool from bluez repository.

Current rtl8723bs_config.bin contains following configuration:

```
$ rtlfw ./rtl8723bs_config.bin
Analyzing ./rtl8723bs_config.bin
Signature: 0x8723ab55
Data len:  58
len=6   offset=002b,{ 00 00 00 aa bb cc }
len=3   offset=00f4,{ 01 00 00 },PCM_SETTING
len=2   offset=00f8,{ 85 00 }
len=1   offset=0027,{ 67 }
len=16  offset=000c,{ 02 80 92 04 50 c5 ea 19 e1 1b f1 af 5f 01 a4 0b },UART_CONFIG
len=1   offset=01df,{ 01 }
len=1   offset=00fe,{ 01 }
len=1   offset=01e3,{ 00 }
len=0   offset=0000,{ }
```

I've tried to modify rtl8723bs_config.bin and after removing following
config section Bluetooth started to work again.

```
len=1   offset=00fe,{ 01 }
```

Unfortunately there is no documentation from Realtek about these
values. Could someone from the company comment about that? Could we
get official configuration for RTL8723CS or should I submit modified
rtl8723bs_config.bin?


1. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ed9c1349f8ebae720f3572ad3e74af59bfe345d7
2. https://sources.debian.org/src/rtl8723bt-firmware/20181104-4/rtl_bt/


-- 
Best regards,
Andrey Skvortsov
