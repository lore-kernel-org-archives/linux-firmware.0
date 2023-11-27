Return-Path: <SRS0=MncS=HI=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CC5C46CA0
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Nov 2023 19:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED212C433CB; Mon, 27 Nov 2023 19:15:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE924C433C8;
	Mon, 27 Nov 2023 19:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE924C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a0064353af8so1088801566b.0;
        Mon, 27 Nov 2023 11:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701112504; x=1701717304; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjdsAYaBUOrZ26qfQ6Jgiw57PN3OpOdatD/IlJzmr2w=;
        b=M+ezoUHZ353G5lD1H2a7d5AxkCVJjSItzNaOuf9X12gEK4X+DxWRYZZQoHSEhddRGo
         238/ssFvF/JtsdO73WLLCCAAPQ73pJVvuY5c0iSEUs6M388uQBDrqLyNsOgCX5ofs1pE
         QrvboLdJO3RIoLHWjtYxtx0c6pM+4Gu1TcwpRSEeInYyUp7hr1cKUg34kNCjLghIw5EY
         NQCOTq+1I6LDpUv0ajwvGo67j70dXsfqPolWqqUx9fQtdN+BZ+JE9v9oYTtFVYZR9SXQ
         1E+HL5JP9C7U5FIMVf3gxmkdq4XkRR3LfP4a0eZyPhE/BHHR121bl0vkERvlF/N7FGii
         92Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701112504; x=1701717304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjdsAYaBUOrZ26qfQ6Jgiw57PN3OpOdatD/IlJzmr2w=;
        b=DeoGIbip7r0Orr3/R0Ol9J1fhfTRpMcytDZKKPRZuImqvyloexL/cUNW8woQ8wwSzk
         DhXJn40LdvTBEne91B10KkfgurYSV6YTe6F9r21CLGBZk69rY1+6imv8o+1UITCQUzgQ
         9BFB/EZVgFROf9/YMLm7+lcrD5G3VgJHjR1cXG7FIr1tDlKd6HY0QCAVtNBbonPqAADz
         fhZFHssLbkYH/D6psNOAE0EVvnKS9BJsQ5FO3vUBjcIEMv4YTRC7laqW6zXD6hwIUL1o
         kx2rr7Gu1ExxtgIqfJ7gUm4fn9JH6nhvLtkQV/sfR8pW2KnnlpdC0wQ8KyAixOz9oeMf
         k4Cw==
X-Gm-Message-State: AOJu0YzcFEUDjY4uWL4/G+qpn3EZi4SrEUn+2aZI/g+849IncAKTisW0
	1K/bNLr7GdXovwUeILKr2WxVsK7nq7QhPZZpKi27u/PqyNmcng==
X-Google-Smtp-Source: AGHT+IE9K6eGV0ubA8YjoNUAUV3bLA8P3ILpukWu5q16MNfqV99nw7oM2r+lJ+/XrUHXFsrRW1c88/+0BxjWyYwUr9g=
X-Received: by 2002:a17:906:51ca:b0:a0f:fe8:6a72 with SMTP id
 v10-20020a17090651ca00b00a0f0fe86a72mr4470487ejk.27.1701112503801; Mon, 27
 Nov 2023 11:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20231122173041.3835620-1-anthony.l.nguyen@intel.com>
 <CA+5PVA5ULYE=b-_O6JjhtPM2zASCzEbcK95eQBfhs=tQSkPhWQ@mail.gmail.com>
 <CA+5PVA6FrzEy1RSMnHA_xixdOZDF19VZcuC1O9bMhdH39OXLRA@mail.gmail.com> <e77ba51d-2bd9-ed70-ec9c-60799fa21053@intel.com>
In-Reply-To: <e77ba51d-2bd9-ed70-ec9c-60799fa21053@intel.com>
From: Mario Limonciello <superm1@gmail.com>
Date: Mon, 27 Nov 2023 13:14:52 -0600
Message-ID: <CA+EcB1OSrgy8Ni0Y2cd-5xfr9FHQJ2-RK3umwVwDoQYf2A3stQ@mail.gmail.com>
Subject: Re: [linux-firmware v1 0/3][pull request] Intel Wired LAN Firmware
 Updates 2023-11-22
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org, netdev@vger.kernel.org, 
	przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 11:21=E2=80=AFAM Tony Nguyen <anthony.l.nguyen@inte=
l.com> wrote:
>
> On 11/27/2023 6:06 AM, Josh Boyer wrote:
> > On Wed, Nov 22, 2023 at 7:10=E2=80=AFPM Josh Boyer <jwboyer@kernel.org>=
 wrote:
> >>
> >> On Wed, Nov 22, 2023 at 12:30=E2=80=AFPM Tony Nguyen <anthony.l.nguyen=
@intel.com> wrote:
> >>>
> >>> Update the various ice DDP packages to the latest versions.
> >>>
> >>> Thanks,
> >>> Tony
> >>>
> >>> The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb=
855ab0:
> >>>
> >>>    Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09=
:23 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git d=
ev-queue
> >>>
> >>> for you to fetch changes up to c71fdbc575b79eff31db4ea243f98d5f648f7f=
0f:
> >>>
> >>>    ice: update ice DDP wireless_edge package to 1.3.13.0 (2023-11-22 =
09:14:39 -0800)
> >>>
> >>> ----------------------------------------------------------------
> >>> Przemek Kitszel (3):
> >>>        ice: update ice DDP package to 1.3.35.0
> >>>        ice: update ice DDP comms package to 1.3.45.0
> >>>        ice: update ice DDP wireless_edge package to 1.3.13.0
> >>
> >> Sending a pull request and all of the patches to the list individually
> >> seems to have confused the automation we have to grab stuff from the
> >> list.  The first two patches are merged and pushed out:
> >>
> >> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/75
> >> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/76
> >>
> >> but we never got an auto-MR for patch #3, and the pull request MR now
> >> conflicts because we applied the first two patches in the series from
> >> the individual patches.
> >>
> >> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/74
> >>
> >> Mario or I can fix this up, but in the future it'll just be easier if
> >> you send either a pull request or individual patches, not both.
> >
> > The third patch is now merged and pushed out.
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/85
>
> Thanks Josh. I was out for the Thanksgiving holiday. Will send one or
> the other on future sends.
>
> - Tony

Even better - if you can open up MR directly at
https://gitlab.com/kernel-firmware/linux-firmware we don't need to worry
about the robot messing up or you needing to pull one back because of
a mistake etc.

Win win for everyone.
