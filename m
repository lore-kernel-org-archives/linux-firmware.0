Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216D2C3DA49
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jul 2024 11:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBCE0C4AF10; Fri, 26 Jul 2024 11:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55ABC4AF0F;
	Fri, 26 Jul 2024 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721993574;
	bh=w9xFYhmu1Bzy8WoLpg3H1kMbSk/5sIlDqvltcKRXSjk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XCrNa0lPj6JYDGkcffcr8HqmBpkFlGZvRONm0y+KfnHqmS7PqY0PcgL6w9UmOi28z
	 /DmbzLEGj9qnpqYxxOZjVprRiZ9gyTl1QQ8nvtFI5q2IArWTdxp7KiENHy78nakMmu
	 rZlvRO8hSITVFnbD3J/Vq5pEurBqyZvVy63VsRxsgzxJq+SgQcfSVJ8fDqYYKdFM0n
	 Bd21qN2/dpjoTunQEx7bmQGNhUnJlJ0PCxkY1aWbc9/u9sUfyh7M9/Y0nuN9ZJrWH/
	 WrWx/qhvg5awNP47+Jc0kavKvOPx53gcZcXM6IOsBg20z0lBvOO1HGWoBFtKlqShuE
	 x7f1WHZWAmMGA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66c7aeac627so21358327b3.1;
        Fri, 26 Jul 2024 04:32:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyzpztLnjNvc6fz5AWcrwqNmuTgcucyxdxcRIqjWhJdoPnYez/LrI/Y5KM/Sa9LcPzCIMyypQKjrz8nSD6CET1z966uFBnufQO
X-Gm-Message-State: AOJu0YxVkV3DnMiWjPZqan3ZG5b2YZIqjgpGT8lKDQdWuCVKRWoqbcJ2
	RukK8m0/CxcYoJP5xXCo5w3bmpyMKt/uMyHrc8MGIB0PJFfOpzN7nrCI6DGWPL4HprVwA2VOJXk
	KNEEugm7TRo6NhkvoH3iY9byILDE=
X-Google-Smtp-Source: AGHT+IF66Xsb6EysU8CaIQd6YwLPPit8Un4f+snzvBgCraLWhDTxmNy/Mm4ivO8x82y9XaSWvGJ9JPT+WlaNZXOEn1E=
X-Received: by 2002:a81:8a82:0:b0:652:d0a9:87de with SMTP id
 00721157ae682-675b70fbf95mr54199737b3.35.1721993574096; Fri, 26 Jul 2024
 04:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB581002D586D332CACEB335BAA3AB2@MW5PR11MB5810.namprd11.prod.outlook.com>
 <CA+5PVA6zGFMsV16BhmbB9QnZQ9UsUw1-44MK6gOc84MnhroDXA@mail.gmail.com> <92696aa1704e43897cbed421136845745e023127.camel@sipsolutions.net>
In-Reply-To: <92696aa1704e43897cbed421136845745e023127.camel@sipsolutions.net>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Jul 2024 07:32:42 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4zbkNYyigULrcOons7bCx2yL+Jgg7jWjo7AOn3d0bOGw@mail.gmail.com>
Message-ID: <CA+5PVA4zbkNYyigULrcOons7bCx2yL+Jgg7jWjo7AOn3d0bOGw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-07-25
To: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 4:46=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Thu, 2024-07-25 at 16:03 -0400, Josh Boyer wrote:
> > >
> > >   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmwa=
re.git tags/iwlwifi-fw-2024-07
> >
> > git fetch https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux=
-firmware.git
> > tags/iwlwifi-fw-2024-07
> > fatal: couldn't find remote ref tags/iwlwifi-fw-2024-07
> >
> > Did you forget to push the tag out?
> >
>
> That's ... curious :)
>
> Seems like the day ("-25") got cut off at the end, we've always used
> dated tags here, and there is one from today around the time Miri and I
> were discussing this issue, named "iwlwifi-fw-2024-07-25", which also
> matches the subject. No idea how it got cut off in the email though.

OK, thanks for the info.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/261

josh
