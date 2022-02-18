Return-Path: <SRS0=8dif=TB=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F31C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Feb 2022 15:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00C4CC340EC; Fri, 18 Feb 2022 15:56:29 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 895AEC340E9;
	Fri, 18 Feb 2022 15:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 895AEC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id p15so3538393oip.3;
        Fri, 18 Feb 2022 07:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kzA1lOiKxv2RhyC+zsM+4ITmXvLkhsxE0DWQvl7Fsc=;
        b=X3isYzAhVKrxM31CRG6/erckss5tXlt7rOhk0+K1/kYJ2PT3rZmcicVUS7UNZZJAZJ
         TsPgSz3QFT9yb7oIaudbILx1aKVxZEKk0r4R2skPaRx6obQECmqvICIw+wq/V9JOWfJD
         GtrfYL1Xoa3cLv2Nr2hqPATOXfDYr68X60rt8G9I7lVsNVGUtE7xT/xymjvUkjuE9ako
         tstQl2Dv4c73yKHKMjyzz/EJhyWBd9btRDm5GK23Wj2mR/U9L6V8MUIG1equfYVHkPA7
         shYDd0UcOCAHjxRDCsxC6UHYOJJZwJL0mPkRB2Wik3YPCeueWObDgaFjE7qSpKQOPpfv
         RUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kzA1lOiKxv2RhyC+zsM+4ITmXvLkhsxE0DWQvl7Fsc=;
        b=JOomw1WnJOzviaFk8J0suuV/0BOe7W2tok4cxIIo/MfT9JxupU1i/O1g2rTylijRSz
         0gDBM9ngiG1RfBl6o0HThsJgIHO5jWuSPNvKuxpZNg+HlwqVK5QlKDZQpecRv8nsfk+o
         1uBgDBG3iNeBbWVgqc+6iOkgOshrufLFEYW3MdjiZ/6NWh//MwO6J0XzHflSsK4WVIYJ
         UN8u7DVKcC5Oyy/5oeSn4cEswZKZgkT8xCfyiu3kxrFY2DQuf2o0VojABL3lToz/V0fG
         WHbjovg8LA5CX1bso0NbDDaI/Ub2RsgeLcTEgP5LrBlLQ/+mYCRwEX5b28hienr4Qu2+
         xqdg==
X-Gm-Message-State: AOAM533S2Cs43hhS0SGnKJTYoBMKnX3eSuMcS1kKaMdGdgRHbQ7We5P6
	TW9E0fWFluY31MycgahyZbM6Af91+QKvnUNiECjNGqyX
X-Google-Smtp-Source: ABdhPJwg7Yi4bgs8LL1u+YwXqImXbARQTeyGd7MdlUch8ZWlqBcihvLc+GZsDp+g2IIN3uqviPMJ8yR4Wn2lbZzLasU=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr3389081oie.132.1645199787642; Fri, 18
 Feb 2022 07:56:27 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_Pzq2WGN+6N-n3hsfcgOcKK0qCJygz21Um=Ea7LBC6T2Q@mail.gmail.com>
 <CA+5PVA6xs-bGDmqs8G5J9K2CBPo5=kPeJobrLnQQ8mRg4F0ZgA@mail.gmail.com>
In-Reply-To: <CA+5PVA6xs-bGDmqs8G5J9K2CBPo5=kPeJobrLnQQ8mRg4F0ZgA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Feb 2022 10:56:16 -0500
Message-ID: <CADnq5_OhYnLm+ktOYArdG_BhZPSHEFmz5Xji15qO4g1u58s+yg@mail.gmail.com>
Subject: Re: amdgpu firmware updates for 21.50
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Fri, Feb 18, 2022 at 10:50 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Thu, Feb 17, 2022 at 11:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi,
> >
> > amdgpu firmware updates.  Please apply!
> >
> > Thanks,
> >
> > Alex
