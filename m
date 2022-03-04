Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66232C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 12:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BC75C340F3; Fri,  4 Mar 2022 12:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164D1C340E9
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646397107;
	bh=eyvAhI909JUNCU7oG+S7+8ykpE9ER3gHuE9H4ebhHZM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Um7q5yuhY8GjE5Q8iU/l31zFCjc6LrbV3t6UyVGysqp5/rrJHBBYcvKPg7nUFaof8
	 Z0R2srjlNiM59Q20YeFhzQTDd3/OJsUngCxV6q7DOaZuLAONYgOe/jz80gp57SIHd/
	 VEPy7w9M1EoosBpB8bxlzRxni1JqX0njYKMP+OT1g1BaeV7nqozNC7UGdyDG48HCBQ
	 YTxcjp2zDEyfhOm+aRyRVN9buWB9qneteJUjxu9NsD8lbst0jO4wSNj7wAuRNnhEfA
	 yIGQw8Zaw14n0ZEZMdSfTz4FvuZNi66Jtvswh8Z3XfR6whVNJ14rD2U9cu3Jcu7xz9
	 /Oe6xCzeVT8TA==
Received: by mail-il1-f179.google.com with SMTP id 9so6385450ily.11
        for <linux-firmware@kernel.org>; Fri, 04 Mar 2022 04:31:47 -0800 (PST)
X-Gm-Message-State: AOAM531K7F3kAbA3IlzTwnargeRXgk//qv5Ldh7GgGj4WHgnNOvdmclH
	W8lBZ1Cn3t4Xulbdb6s2JEclfcCQR4ziN1HEjRg=
X-Google-Smtp-Source: ABdhPJw6rlqB94it7C35ZKof9I7LtAyMSmWAVmCVuA3ATCkXflqwmolpjdg7I3/KhxbJrKYvZXmYED0zmIEzLkCJVSk=
X-Received: by 2002:a05:6e02:1687:b0:2c2:787c:b35e with SMTP id
 f7-20020a056e02168700b002c2787cb35emr34524914ila.2.1646397106248; Fri, 04 Mar
 2022 04:31:46 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_MQjQtFref9XX3gaePFTEkisiKxNM37Hg7_4qqcye6Z4w@mail.gmail.com>
In-Reply-To: <CADnq5_MQjQtFref9XX3gaePFTEkisiKxNM37Hg7_4qqcye6Z4w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Mar 2022 07:31:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5ZHRDHXZ-1MpF9dxbZv1DL_mS+7cHciOfKE+XxLzFh5g@mail.gmail.com>
Message-ID: <CA+5PVA5ZHRDHXZ-1MpF9dxbZv1DL_mS+7cHciOfKE+XxLzFh5g@mail.gmail.com>
Subject: Re: amdgpu firmwares updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 8:53 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated firmwares for various IP blocks.  Please apply!

The 4th patch had an error:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: amdgpu/sdma_5_2_7_sdma.bin listed in WHENCE does not exist
E: amdgpu/sdma_5_2_7.bin not listed in WHENCE
[jwboyer@vader linux-firmware]$

I just adjusted the name in WHENCE to match the binary file name
locally and pushed the set out.

josh
