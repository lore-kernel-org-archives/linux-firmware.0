Return-Path: <SRS0=4i0d=RS=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB6CDD0F4
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 20:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B58BC4CECD; Tue, 22 Oct 2024 20:59:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB414C4CEC3;
	Tue, 22 Oct 2024 20:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB414C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb518014b9so53371531fa.3;
        Tue, 22 Oct 2024 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729630773; x=1730235573; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTudk5vQXNINauP6jDgGSlnIvc7JTxAwGQz9NBtCN88=;
        b=k5PgTUmN399brMU0Py7WbnPO95HIJ1t6OPv6h1WbH+rjU/9LnRq/5Joi/J87c8yDYZ
         aC58W5cts48a8cHF3TkmEimrmA4PMCC2uG4AU48yHkN+TxtdcIPt+/ljqPhEZMPf9HrQ
         Jb5uX6DGzyrKuNKBjMat4byPU70C7fGxmuIiaUzopV94FcxrynL5SJvCXY6vxerBydum
         /2VbB8H6yShrRe6UoQw+ltGHgARxr2PUfWhV4FWZ+PoPG085U+J9KU1GTRspglf45m6Q
         QG0mQ5JmAKgnjVK9NEHCJD3jJSXPUXhSVsyAAwFOaEWDoaHWt6w5ZsP/lLTf6Ez2XxYk
         fBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630773; x=1730235573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTudk5vQXNINauP6jDgGSlnIvc7JTxAwGQz9NBtCN88=;
        b=HsAPTgP8eRCcArTmNyijceSF4BGPHf3gQ1GBbZnnO3Juv+INGPaFPFG5+1NDsef4Ji
         j7tPuCsFtX38T40D9Tfok9zBZq+TgI1B0UmmQKlhkGlIbpwYUjbbHhzqO7VUBy6mJ3Io
         KEv/Lk+E5F3Z8V0+nBLp0hH70tKF3Y3i6uspy0nqVwd4EcazponfVdIEHHzXYOpjLblM
         yatXCM1kO7hgQl8T4FHY7pCFZEHIMIA4mpA7sd3OEcHHWO8R0EowO43yBNQ4E6ReHf9S
         09+C/JPTiaJ4jQdPqTBCG7+VuIZnbRQGPbAO8O0YtCl2wKnG/wuCo/Iizwx2nqDxz373
         7x7w==
X-Forwarded-Encrypted: i=1; AJvYcCXrc6379Y6cewleb1oyoPuhHPqss/2ZJYmN7PsAt3Mt8j75nX+FHVje4rRDv5kk5K3NGm107XDqA06JPMhxcg==@kernel.org
X-Gm-Message-State: AOJu0YyeLOCxvZH/0DWEF3WDZO4879CeySkfWYtPaZOiLWLzuJg9jaBZ
	j/AbjD+UD4sGvJFlDj62f+YA2OMI3PVml+T1Hxuvyj9z6oVAGasT358o3JZx+Wn9+MmDq0FJzNz
	rCJnnujuqhKTuf4mrE6Tgkci1MkOrMw==
X-Google-Smtp-Source: AGHT+IECK0miY2kjmlSDTS0j4X7zmVTC4MTPDE7DhSHNr1KQKjyg/IDG1qgp3U6s4SUWTREesEQejCBo7Vaj731Cl+0=
X-Received: by 2002:a05:651c:b21:b0:2fb:607b:4cde with SMTP id
 38308e7fff4ca-2fc9d5e2962mr1306321fa.39.1729630772333; Tue, 22 Oct 2024
 13:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
 <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
 <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com> <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com>
In-Reply-To: <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 22 Oct 2024 21:59:19 +0100
Message-ID: <CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com>
Subject: Re: check_whence.py: Add function to get listing of files
To: Vivek Puar <quic_vpuar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Oct 2024 at 20:09, Vivek Puar <quic_vpuar@quicinc.com> wrote:
>
> Hi,
>
> I've created another pull request, please review it.
>

Pull requests are not for reviewing but for merging code. They have no
code to review.
Please either post your patch or open a MR upstream.

Thanks
Emil
