Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE34BCF11F5
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 13:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9BA9C4CECC; Thu, 10 Oct 2024 13:30:49 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCF0BC4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 13:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCF0BC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-27beb2496f4so308768fac.1
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728567048; x=1729171848; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SK4LT2nNm84AhZpXABE570v9PceMVgU3Fb2pHfApgw=;
        b=fJOUs+d1Y7CI3DwxpHvY2tZK9ua4nz6y5mraPeiE3popvJbxDFwMm8kAv/S8GEowWn
         Cqz2I8hQBjt70BbXUosyOLNLtPJ88gWwv+9sDai9Yk4nqYd5bdhwIvcLSIrm1jIPd8hd
         b0sZWtaN9KY7lUCNe9q/PlO3Vn322v57/P/P5AuEkdraY7IzmY1jWMA1uP+kEeBxgXs+
         2uuSkWP7zjgbGVORFNsyEVvNMl2D9j6TiamU6ddyRlWQZ5SztS7R/9mlVGLYkpW1ZjMW
         ETq/q7ouC5g7BeD3NMB0TIp/et6e9U6WWuEcMBMpATlgYq8/6VEEZ04vLBm3ATZwyUdC
         liEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728567048; x=1729171848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SK4LT2nNm84AhZpXABE570v9PceMVgU3Fb2pHfApgw=;
        b=D/48WeWfJBcGvtuZJOEHjK1Dj//olyl/VPezFgb5z/4s41CcK5JlTpc/qKGNy/4dIB
         bsm0GXiweD7lRJe7LReQ86S1oDQbnMtV9FVF7y9mx9PymjgL/fVXzmG0ce6QfAMp2GY6
         KQrR3p4Gpev/P/vyTnRBSgWgaE99KIG2PX1dlfCwbx4SOKO7drGETu4NUI5E8iOkf9H1
         SauIjnpKyzj7/BoQFLqsQJl5iU79odDr18TytQP86NdPH3g+32g3KdCmXy+9syveipW3
         SRwJs2tbGluFTuhmUa99ZgJmysUr8EgTyH3IP23UZnUk8M1vueNe5qGHLCCiIk5phvX0
         maNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvaWhvILywH1JPRPCQUCmCCZRYQZf/YmhZ9anstGBWMDSLAIQt/QjWE/6fHdpiCISgkwx+7CWJg/gDfJKpkw==@kernel.org
X-Gm-Message-State: AOJu0YxlSrfBEvBwsEeBESAVkiula6lHCjom2lOhpcRGoyCxm9yPJLRx
	RsNGqpElUygRFsa+0XGtrDXN7SIKZ8eS8j8Sz3UZUIZgO3vo/DrZ
X-Google-Smtp-Source: AGHT+IEkCCEyay3cKAq4bSPwIgeCPS8DRUBLuKqweN2kQt/3ee+FraBEJFL65l9+hg56tgRFbAH9Fg==
X-Received: by 2002:a05:6870:d93:b0:25e:940:e934 with SMTP id 586e51a60fabf-2883454e9damr3677014fac.47.1728567047426;
        Thu, 10 Oct 2024 06:30:47 -0700 (PDT)
Received: from ?IPV6:2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a? ([2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28858360ebfsm274657fac.35.2024.10.10.06.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:30:47 -0700 (PDT)
Message-ID: <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
Date: Thu, 10 Oct 2024 08:30:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
List-Id: <linux-firmware.lore.kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "Xu, Baojun" <baojun.xu@ti.com>,
 "derekjohn.clark@gmail.com" <derekjohn.clark@gmail.com>,
 "13916275206@139.com" <13916275206@139.com>,
 "romangg@manjaro.org" <romangg@manjaro.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "Chen, Robin" <robinchen@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Yi, Ken" <k-yi@ti.com>, "philm@manjaro.org" <philm@manjaro.org>,
 "jlobue10@gmail.com" <jlobue10@gmail.com>, "luke@ljones.dev"
 <luke@ljones.dev>, "antheas.dk@gmail.com" <antheas.dk@gmail.com>
References: <20241009101807.1473-1-shenghao-ding@ti.com>
 <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
 <7e138a1c8b6d4ace8c759bb2266216da@ti.com>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <7e138a1c8b6d4ace8c759bb2266216da@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in ti/tas2781, yet it reported "does not exist".
> I have no idea why the file is there while report "does not exist". After I removed the newly-merged, no such report.

I think you forgot to git add them to the commit?

> 
> Following is the log.
> 
> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
> Check that executables have shebangs.....................................Passed
> Forbid new submodules....................................................Passed
> Check Yaml...............................................................Passed
> Check for broken symlinks............................(no files to check)Skipped
> Detect Destroyed Symlinks................................................Passed
> shellcheck...............................................................Passed
> black....................................................................Passed
> markdownlint.............................................................Failed
> - hook id: markdownlint
> - exit code: 1
> 
> internal/modules/cjs/loader.js:818
>    throw err;
>    ^
> 
> Error: Cannot find module 'node:fs'
> Require stack:
> - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js
>      at Function.Module._resolveFilename (internal/modules/cjs/loader.js:815:15)
>      at Function.Module._load (internal/modules/cjs/loader.js:667:27)
>      at Module.require (internal/modules/cjs/loader.js:887:19)
>      at require (internal/modules/cjs/helpers.js:85:18)
>      at Object.<anonymous> (/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js:5:12)
>      at Module._compile (internal/modules/cjs/loader.js:999:30)
>      at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
>      at Module.load (internal/modules/cjs/loader.js:863:32)
>      at Function.Module._load (internal/modules/cjs/loader.js:708:14)
>      at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:60:12) {
>    code: 'MODULE_NOT_FOUND',
>    requireStack: [
>      '/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js'
>    ]
> }
> 

This looks like you're missing some dependencie on you system for 
markdownlint. You need nodejs v18.

If you can't install this you can skip this check when you commit by 
adding "SKIP=markdownlint" to your environment while running 'git commit'.

> Check whence.............................................................Failed
> - hook id: check-whence
> - exit code: 1
> 
> E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exist
> E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exist
> E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bin in WHENCE does not exist
> E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bin in WHENCE does not exist
> 

These files are missing in your commit or they have broken links. 
Double check them.

> make: *** [Makefile:10: check] Error 1
> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls ti/tas2781/TAS2XXX1* -al
> -rw-r--r-- 1 root root 35220 Sep 28 21:54 ti/tas2781/TAS2XXX1EB30.bin
> -rw-r--r-- 1 root root 35220 Sep 28 21:55 ti/tas2781/TAS2XXX1EB31.bin
> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
>>
>> Thanks,

