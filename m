Return-Path: <SRS0=/GBh=WF=gmail.com=maxim.cournoyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EBFC282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 06:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FABFC4CEEF; Tue, 18 Mar 2025 06:42:35 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D134C4CEEE;
	Tue, 18 Mar 2025 06:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D134C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225a28a511eso87266175ad.1;
        Mon, 17 Mar 2025 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280153; x=1742884953; darn=kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsYjZ6oP9dMx7UOB5RidGS2g9PtT8swtaXvrHxU88RA=;
        b=kqeRHiuebhsnMThDEbzv4V+7YbXYNDKx2q+1octph6XmVn5fZuxsje+CDpoyFjbz77
         TxcWFKdtTYoNT40+ihAiYE76IoVudSn81jbmDHSn9tKmnffPmZ6e3upc3oG4ECHxHtx6
         a49mg7SoJJUlcFTqKDeyuvBsuyndfkkPvWXH6R+vj+ByKFieLVZywJ6yVpaI+GXRI8zO
         LnLyyYy7mCO2SWc9YsiISlRhkwUM329Hs7pjxAnsqdxCdYFHa3j4Iva73Wrdokjh5EBp
         Q8pMuK8NEYMn3Goqq+UffONavl3DPKOF6NVS6k5KvqXRDrcbssiw7v2Kyz1bixlVBl7n
         AAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280153; x=1742884953;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsYjZ6oP9dMx7UOB5RidGS2g9PtT8swtaXvrHxU88RA=;
        b=KKjAzHQ/SqGlbhLRd/4ABYRdhVANtYbnL32XlzdYBclCSsa8Azg/ZvB+nEjpiZDmCz
         VShayGGz6nb/99qy+9bYgKQ6ur03rcgcPKjGFli89fgtvE28a/FerH3cKNy6OLUcFDpK
         dkozr6NCoTArHgqEzysIadGov7Boww3VPs06/WKA6XnZ1RsPda2DCnJBMRrAOPJNcCaP
         sWmCrAH9arIf0rShHteGVJWvuLviKSwp9/hEoBjiV2cnvfKhkRPMtSMC0DV/LNaDA3Ms
         y4gPhIlASrxExHTOYo/Oq1zI5x3UJUk4gxylkAL9XZpm8P+lmEs7BJ+JGYlg5pXrOi9m
         rWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUEpZKnVGZh5+R27XcNOmN+smnuKK+OSc7+7DqtQ/6GWpMcZFsLitfRLNAXFhFlRqW/NmvunQ5s8aiL/80ew==@kernel.org
X-Gm-Message-State: AOJu0Yxy781GTO+bNQCQJZGKiJkkF2ikekrth6q9IYYdLEd67PCN0O1m
	NWmpuWPhGT7zL6M6CFSbCu5uksBbcEq3prSSFcM9p8tXUw32wmHvJ197KGkf
X-Gm-Gg: ASbGnctOt57wHfc4o+DPi7NwaoxT6uFj5YX9ei42zRzZwvM9a7eKxshlBtEb6f0S2Jn
	ISUIMfwHlysZ8yMCzW8UZcMmTZNmC7SKbxcROiJ0lc7hO6aj7vYWUZEoGZrFUSygeT6ad/pE4Ht
	XO9ZPpEPnauR2Ot2GBLD6AGLuMzMZWAeKLUcIuPg/CjOG+TFkmsMHADAWcVOuyeUrE5nRb3jp/b
	lB5Y1ptlNh7N4qo0oRPPw9FDu4OHMZSW6V7IxY2tvoofs5W5fZSSh3vlDwp7XRQC3aT1vWYKJ7j
	T1lHhSXL9MvFgmJ09T9qyOS0l5WqqcRMgJzrNlzAc4FgmqsbbGEXLg==
X-Google-Smtp-Source: AGHT+IGWeFtZZ+eBTwepnmfrlknT6F3Lu3H5LlX5ZclpSuHQQeSXr4Lpi9aFWq7qVZXASrChkooDeg==
X-Received: by 2002:a17:902:cec5:b0:224:abb:92c with SMTP id d9443c01a7336-225e0b19692mr168716715ad.50.1742280153402;
        Mon, 17 Mar 2025 23:42:33 -0700 (PDT)
Received: from terra ([2405:6586:be0:0:83c8:d31d:2cec:f542])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba721esm86411315ad.149.2025.03.17.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:42:32 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: <jwboyer@kernel.org>,  <superm1@gmail.com>,  <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils
 parallel is installed
In-Reply-To: <20250317191606.64181-2-ttabi@nvidia.com> (Timur Tabi's message
	of "Mon, 17 Mar 2025 14:16:06 -0500")
References: <20250317191606.64181-1-ttabi@nvidia.com>
	<20250317191606.64181-2-ttabi@nvidia.com>
Date: Tue, 18 Mar 2025 15:42:18 +0900
Message-ID: <87h63qyh4l.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain

Hi again,

Timur Tabi <ttabi@nvidia.com> writes:

[...]

>  has_gnu_parallel() {
>      if command -v parallel > /dev/null; then
> +        # The moreutils package comes with a simpler version of "parallel"
> +        # that does not support the --version or -a options.  Check for
> +        # that first.  In some distros, installing the "parallel" package
> +        # will replace the moreutils version with the GNU version.
> +        parallel --version >/dev/null 2>&1
> +        if [ $? -ne 0 ]; then
> +            return 1
> +        fi

I just rechecked; I don't think this currently work, it'd require
complicating the script to accommodate this less featureful parallel
variant, which is why I had opted to use GNU Parallel in the first place
:-).

If you inspect how parallel is used, it is passed a list of commands
from a file, which GNU parallel accepts via its '-a' option:

--8<---------------cut here---------------start------------->8---
    parallel -j"$num_jobs" -a "$parallel_args_file"
--8<---------------cut here---------------end--------------->8---

Moreutils' parallel lacks the '-a' option, and doesn't appear to offer
something equivalent.  So instead of simply adding appending your
command lines to a file, you'd have to build a space-separated list of
quoted commands... which makes quoting annoying and complicates
debugging (in the former case you can just inspect/execute the commands
file).

-- 
Thanks,
Maxim
