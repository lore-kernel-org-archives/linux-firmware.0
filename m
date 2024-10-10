Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD5ACF11F5
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 13:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7918C4CECC; Thu, 10 Oct 2024 13:39:29 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96FF8C4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 13:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96FF8C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-717677ed0abso392268a34.0
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728567567; x=1729172367; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/5oD19F2CvSUf5KMDAPz1qSOxfdRn1SXsIt77wo3N0=;
        b=TbqypIOfDnJVS85cFJ8UT3wXPZQIpU+eTivZBb1mcwYMLd7sz8tRK2C0t68UmNtHbo
         X0O4PM5AW1rsFNVhC1k8/AtNNRuZzxywBkrx4InYF3+idBbITkwc2JA+BjKTpc0MrJH9
         4PbNXxJRPq6q/Kwf1g7awNJhHw6JLqPyXcm9iLJ2Df6kLU2LZEiukQTjkKvJSVQkjE+m
         +IzFaRj2l7vBA5lFyAxmji1KrzIblXPLRjuraZ1Z3/dYaPyYgE9USt+Gcci6DQSMXVb3
         LCOb4IJ91+mbpIdtTeoG/BuGfGrEtYJvvkOy05m1MM4nT6iWcYA9bTbZvqIELjnbrmJp
         8QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728567567; x=1729172367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/5oD19F2CvSUf5KMDAPz1qSOxfdRn1SXsIt77wo3N0=;
        b=bGbMmUUIgylCd5QttJ/XmIFnh6QPyTKaddfo+cq1SoJRNM3kRSG37UUxq/O/mXlKi3
         j+UZe2JY0qou4T+PsV4Pqg7lKov8OYrbgSbj3pXxTtMEQ4yOCUK4MJlkzhHXMr2STQP3
         zCbza+a1mwIeHIwyQNHpLQwvM0RMaQiIgesLRulHrUrQbZrWWYWfQIY9T8L8g4/8RjCw
         pTZv2onNUc+BLfI8NeWNHIqYEDhKS+Y1HGHJXEDykJuoB43JGG660rHToDj0yrSRvWx8
         dbpM6FCaN9jiue6VDwSUezcmuN1tYTPpjJTViHsQvOTZrYIwf3gaslmixndUIGcf0Iq0
         IK4A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1/cmEULG0H0jL/fquocgmDo1idP3QY3jHmH1fBthbNA/xifTRLa7ZsjAwagQ3npfvuJCoJbpdY6Te+onBw==@kernel.org
X-Gm-Message-State: AOJu0YxxeGIQQJ04FF6tLFZGXbpX3N92Jp6WjUJ3m3+KcpCEaMuEV4me
	+vKydCi3pTaXa478wZvBkf3AScfi5FbAJlBdPW+revvzSd5k7wxa
X-Google-Smtp-Source: AGHT+IGD8q+GYamlrGgrfMA8nr9LmsSuLmSVt4AQiyupapE+xnBHx/01M0Gq3hS661Az0OLKlde/tw==
X-Received: by 2002:a05:6830:668e:b0:710:f879:a15a with SMTP id 46e09a7af769-716a4318443mr5550008a34.27.1728567567498;
        Thu, 10 Oct 2024 06:39:27 -0700 (PDT)
Received: from ?IPV6:2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a? ([2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-717cfed76besm184600a34.11.2024.10.10.06.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:39:26 -0700 (PDT)
Message-ID: <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com>
Date: Thu, 10 Oct 2024 08:39:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
From: Mario Limonciello <superm1@gmail.com>
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
 <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
Content-Language: en-US
In-Reply-To: <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/10/24 08:30, Mario Limonciello wrote:
>> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in ti/tas2781, 
>> yet it reported "does not exist".
>> I have no idea why the file is there while report "does not exist". 
>> After I removed the newly-merged, no such report.
> 
> I think you forgot to git add them to the commit?
> 
>>
>> Following is the log.
>>
>> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
>> Check that executables have 
>> shebangs.....................................Passed
>> Forbid new 
>> submodules....................................................Passed
>> Check 
>> Yaml...............................................................Passed
>> Check for broken symlinks............................(no files to 
>> check)Skipped
>> Detect Destroyed 
>> Symlinks................................................Passed
>> shellcheck...............................................................Passed
>> black....................................................................Passed
>> markdownlint.............................................................Failed
>> - hook id: markdownlint
>> - exit code: 1
>>
>> internal/modules/cjs/loader.js:818
>>    throw err;
>>    ^
>>
>> Error: Cannot find module 'node:fs'
>> Require stack:
>> - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/ 
>> node_modules/markdownlint-cli/markdownlint.js
>>      at Function.Module._resolveFilename (internal/modules/cjs/ 
>> loader.js:815:15)
>>      at Function.Module._load (internal/modules/cjs/loader.js:667:27)
>>      at Module.require (internal/modules/cjs/loader.js:887:19)
>>      at require (internal/modules/cjs/helpers.js:85:18)
>>      at Object.<anonymous> (/root/.cache/pre-commit/repoxl59c0uz/ 
>> node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js:5:12)
>>      at Module._compile (internal/modules/cjs/loader.js:999:30)
>>      at Object.Module._extensions..js (internal/modules/cjs/ 
>> loader.js:1027:10)
>>      at Module.load (internal/modules/cjs/loader.js:863:32)
>>      at Function.Module._load (internal/modules/cjs/loader.js:708:14)
>>      at Function.executeUserEntryPoint [as runMain] (internal/modules/ 
>> run_main.js:60:12) {
>>    code: 'MODULE_NOT_FOUND',
>>    requireStack: [
>>      '/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/ 
>> node_modules/markdownlint-cli/markdownlint.js'
>>    ]
>> }
>>
> 
> This looks like you're missing some dependencie on you system for 
> markdownlint. You need nodejs v18.
> 
> If you can't install this you can skip this check when you commit by 
> adding "SKIP=markdownlint" to your environment while running 'git commit'.
> 
>> Check 
>> whence.............................................................Failed
>> - hook id: check-whence
>> - exit code: 1
>>
>> E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exist
>> E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exist
>> E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bin in 
>> WHENCE does not exist
>> E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bin in 
>> WHENCE does not exist
>>
> 
> These files are missing in your commit or they have broken links. Double 
> check them.
> 
>> make: *** [Makefile:10: check] Error 1
>> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls ti/tas2781/TAS2XXX1* -al
>> -rw-r--r-- 1 root root 35220 Sep 28 21:54 ti/tas2781/TAS2XXX1EB30.bin
>> -rw-r--r-- 1 root root 35220 Sep 28 21:55 ti/tas2781/TAS2XXX1EB31.bin
>> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
>>>
>>> Thanks,
> 

You know - as you've been having problems with git and at least I've got 
the intent and your S-o-b for the firmware I've taken your MR and 
rebased/squashed it for you here:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317

I'll merge this and if you have any follow ups you can do them on top as 
future MR (preferred!) or patches to M/L.

Thanks!

