Return-Path: <SRS0=4JFs=U3=gmail.com=maxim.cournoyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B75C02192
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Feb 2025 01:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D5BEC4CEE5; Tue,  4 Feb 2025 01:05:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 483F3C4CEE4
	for <linux-firmware@kernel.org>; Tue,  4 Feb 2025 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 483F3C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21669fd5c7cso89330345ad.3
        for <linux-firmware@kernel.org>; Mon, 03 Feb 2025 17:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738631115; x=1739235915; darn=kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atdiaKexOREttf11llUxhAmWM3yytRggcQ6tDGt6PZ8=;
        b=Ln1KRQbL8EOHcnZY8hjFVDLpPtF4m9V474+Uc3tW4NqTvpg8316AqOEHifzFoXnSwx
         F37WOznQQM4hSJxYzu+ztMvmqIH2scP13DIWqeZsPn/anNrre2z8rgH6nKVFfB3cDbU8
         Z8itp8pFxPYgK9p+RV0uRtoHKJbkZVnN6HccPKxN1e2WBP1Ytv4qqD/U/aOzthxB5+mG
         u3n/coqlqaXZjZQ3sEf+tl1NcgL9WmL5/xkS/g3Ko7rH2t3ww7KYQyYx8udnC3PcHXm8
         WO3PaicbPCa4iTOj6HHO2cnEDli2yD7p71z7LU796koN+2t45LjRd4k5+hN/MgXMjZww
         djBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738631115; x=1739235915;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atdiaKexOREttf11llUxhAmWM3yytRggcQ6tDGt6PZ8=;
        b=AAKQNJatQLyI6ekkVPNgB73te0n6sl5Q8eYXfcHP4pTVtUq6ifaR33XuaaR4E7o5jK
         dytSlvfqVM6WEI2kGTLTnbWcA+XBMm06ehiKTM+RBmL6FzeD0wA6fyEYqL0NzADQtwMJ
         ILD233+JJf9zzP7EyAYZBdZW9Vmc0K/meGks8vdeXtelMfvtIUCI6dEts5a6mR2L+cOj
         pTMzL3BTA9ybKnFtVhd7vJH+s4kuKv5u1aJy+Bzo+YccacAV3pe5P6FyWeRWUFPzXLAV
         4i5FQ/XddObw83wnT4nw27JkUyENxCGbcBk4thqyqbUXZd5Npskyn7HwvDpmTI9M8kC7
         ZBhw==
X-Gm-Message-State: AOJu0YwPMA2DyHjjELHAHwyeQlmmWAJWWrPgmdsqZ7l0xofv9+Hmzqoo
	OvKTCLb191tYb1nbZejev30QVtdZnA2cSMI2glsJIrh7iR70v+OdLe4GK/0s
X-Gm-Gg: ASbGncuOjdp62eSSDVTttTbYOsvlJyVknn2oE2iENBmgjWATAaFo8bH8yqXwIe4rBoz
	xnF1aDXHpjzBIvo3yKklks8j9UFxXuak1jfnTXPIrBQGusHql43XVOgDbrJTBE0e0Dg6cz0Kxxc
	+nO6rvgmojX+y0VZrNjVpYFCBKmn9/XBkGtPUiwZWhTWYtA7RfvTV3PnnxpBZo3DaQcnDMhDki/
	PLMo0ut3y1/TO7akVcp6rgIlU+/O5BmHXhRsGLhu91Q5FVv2mqV+gsOJfwkQbbteU1tzOeQ69lD
	ycRSp/9oxiG6
X-Google-Smtp-Source: AGHT+IFoebV3WD/26TrFlpJvi4Is2uuQACPzuXKBJ65nZPrSNz7vlgrFofNj/JsI/WnUVEdwCDZ6dw==
X-Received: by 2002:a17:903:184:b0:216:6d48:9177 with SMTP id d9443c01a7336-21dd7c354d3mr402014635ad.11.1738631114797;
        Mon, 03 Feb 2025 17:05:14 -0800 (PST)
Received: from terra ([2405:6586:be0:0:c8ff:1707:9b9:af89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0477a9dsm8631984a12.50.2025.02.03.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 17:05:14 -0800 (PST)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: Jean-Christophe Guillain <jean-christophe@guillain.net>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [linux-firmware][bug] "make deb" generates an error on Debian :
 "./copy-firmware.sh: 116: cannot create : Directory nonexistent"
In-Reply-To: <bbd0b116ab4fc8d564ac7e44305f9546f7bebbe2.camel@guillain.net>
	(Jean-Christophe Guillain's message of "Thu, 09 Jan 2025 16:16:32
	+0100")
References: <9efd447b0866dc765a5b1e90318d25a4e3ddddbd.camel@guillain.net>
	<bbd0b116ab4fc8d564ac7e44305f9546f7bebbe2.camel@guillain.net>
Date: Tue, 04 Feb 2025 10:05:02 +0900
Message-ID: <87v7tqbjup.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jean-Christophe,

Jean-Christophe Guillain <jean-christophe@guillain.net> writes:

> On Thu, 2025-01-09 at 16:04 +0100, Jean-Christophe Guillain wrote:
>> Hello,
>>=20
>> I encounter this error when trying to build a deb package of the
>> linux-
>> firmware repo :
>>=20
>> jc@dingdong:~/kernel/linux-firmware$ make deb
>> ./build_packages.py --deb
>> ./copy-firmware.sh: 116: cannot create : Directory nonexistent
>> =C2=A0dpkg-source --before-build .
>> =C2=A0debian/rules clean
>> =C2=A0debian/rules binary
>> =C2=A0dpkg-genbuildinfo --build=3Dbinary -O../linux-firmware-
>> upstream_20241210-34-gc0f414a6_amd64.buildinfo
>> =C2=A0dpkg-genchanges --build=3Dbinary -O../linux-firmware-
>> upstream_20241210-
>> 34-gc0f414a6_amd64.changes
>> =C2=A0dpkg-source --after-build .
>> Built package: dist/linux-firmware-upstream_20241210-34-
>> gc0f414a6_all.deb
>>=20
>
> I think that $parallel_args_file on line 116 is just never defined in
> my case...
>
>> I bisected it to the commit :
>> [2b781910a7d0a7fd67e3d4f40fd8178004c588bc] Add support to install
>> files/symlinks in parallel.

Indeed, I could reproduce with the 'deb' target.  I had missed that
issue with the other targets as they invoke the copy-firmware. script
always with the -j argument (-j1 when not using parallel compression),
which was hiding this issue.

I've now sent a MR to fix that [0]; thank you for reporting it!

[0]  https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/436

--=20
Thanks,
Maxim
