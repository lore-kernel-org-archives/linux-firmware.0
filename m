Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE410C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Feb 2022 15:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8C95C340FB; Fri, 18 Feb 2022 15:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A388AC340E9
	for <linux-firmware@kernel.org>; Fri, 18 Feb 2022 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645199436;
	bh=g6l+93VxHpsLDHtbiBy2iHMZxMj+MRpmHulRF/E9NqA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BNNB/T88HFNNg86Rn+XUeFbwPLWg5r4DqEGNBm0oVlIoOaxsh4KKwHdCaAbiu6EAt
	 IdDSu0mIhcH+aZh5NKhJAAb6ZaiiisBWlDySYC0EvspuqQ25KwdZXgeeCrF/rROZPY
	 P2RhRUjQu0Eup4/8tDqRlPOGlC3V44QtJaLw7JpVy0sDdXN/0Qjmh80TRhkzruMsLg
	 W9YQCyC+aSe/0Pk30A6TxMN1ePNpbm8k6CRcxDN9AFZFjOGD7Tw+AfLfEfCGi1/y5b
	 g8qNH/IuzT8dZ7lJxUmvdFTl2AQQ1ck4tOXENpR1yQKrQm8jpINPQfO6O+7xekEEAW
	 VKzNl1By8LFTw==
Received: by mail-io1-f45.google.com with SMTP id h16so7989746iol.11
        for <linux-firmware@kernel.org>; Fri, 18 Feb 2022 07:50:36 -0800 (PST)
X-Gm-Message-State: AOAM530gmq+1Ye0sNyw8AE1WV28LUnvNX5Sv8x2+XIxtOcuA47MaH5zq
	gmtsfITZtEBbJ6PH58DSQojcGU8V24s+ESouvUI=
X-Google-Smtp-Source: ABdhPJyI2afhowfjTivHIoTSosKN4JL4Zfa9k5nFAYvNqyp/ekZDlAkv0IWMP5+viUwk47tB5BdPjr5xWO0vl2KWmto=
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr5773838iow.177.1645199435956; Fri, 18
 Feb 2022 07:50:35 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_Pzq2WGN+6N-n3hsfcgOcKK0qCJygz21Um=Ea7LBC6T2Q@mail.gmail.com>
In-Reply-To: <CADnq5_Pzq2WGN+6N-n3hsfcgOcKK0qCJygz21Um=Ea7LBC6T2Q@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Feb 2022 10:50:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6xs-bGDmqs8G5J9K2CBPo5=kPeJobrLnQQ8mRg4F0ZgA@mail.gmail.com>
Message-ID: <CA+5PVA6xs-bGDmqs8G5J9K2CBPo5=kPeJobrLnQQ8mRg4F0ZgA@mail.gmail.com>
Subject: Re: amdgpu firmware updates for 21.50
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Feb 17, 2022 at 11:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> amdgpu firmware updates.  Please apply!
>
> Thanks,
>
> Alex
