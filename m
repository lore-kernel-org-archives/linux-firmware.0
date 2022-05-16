Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E62C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 16 May 2022 19:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC229C34119; Mon, 16 May 2022 19:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D0C34100
	for <linux-firmware@kernel.org>; Mon, 16 May 2022 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652729175;
	bh=8peCucMbljD8sIBF44osL+0leVrPtzORy91g7dSJtRY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fNZEoPZb1QgBASuV6Esj9wQH/Ho1B3n6cnSu4cMtw99ZeKX2FPx8P+9USC6oTw2VB
	 617yV5EfJn7DkPkTdIZMxLrfAtpgSAZCyZJ4J4iXqE6vb8hdEDr/rfNKG4400mKBD/
	 ey1cpX7wmDEi6CZLcPdrszmAJUkQ+5HszcFppj3YH52n6uTIge6LYnZ5sP4XNpl0ZE
	 YzJMIeOJ5NYk1ldAGtQZRNNUWIf1yMl1Yzhqwqf+F+tqS2r1ZLeIgjgOnR+sJblNlS
	 SCbb43yL635YdJ/2XFcpJnA+6FIzNBCwReVftdMTcc4kzX+mPts1jT50Wun1/RVBY4
	 kIiHNrY7hrCYw==
Received: by mail-io1-f44.google.com with SMTP id e15so17070317iob.3
        for <linux-firmware@kernel.org>; Mon, 16 May 2022 12:26:15 -0700 (PDT)
X-Gm-Message-State: AOAM532u6PlmvMn1xhQ6M5vzgXHqecC6rlxc636WNiOM9taRxliBO41l
	YAgAsUfrSDVXDGQCKQ1PNbrOFQde6kCFDK62T4Q=
X-Google-Smtp-Source: ABdhPJxLFCfKMcFbpN83mI/x0qzBd27At2jwIUxfs+jO78g+Vl7aF6n061HKsB9JSgklCj5Vw7jwTHfaorcZeSLSOxM=
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr8488924iom.209.1652729175030; Mon, 16
 May 2022 12:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_O2jXZWCf=PYAOciwOi9ouH5vjw=Lce-f_5-SAayCKreA@mail.gmail.com>
In-Reply-To: <CADnq5_O2jXZWCf=PYAOciwOi9ouH5vjw=Lce-f_5-SAayCKreA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 May 2022 15:26:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7HkyVzAmFVKVwyoTnahp8CpfmByp3ncQD01VByKsv48A@mail.gmail.com>
Message-ID: <CA+5PVA7HkyVzAmFVKVwyoTnahp8CpfmByp3ncQD01VByKsv48A@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, "Abramov, Slava" <Slava.Abramov@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Gong, Richard" <richard.gong@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 12:53 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated firmwares for AMD GPUs.  Please apply!

All applied and pushed out.

josh
