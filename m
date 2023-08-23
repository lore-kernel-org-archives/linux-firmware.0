Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30562EE49B4
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Aug 2023 10:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E385BC433C8; Wed, 23 Aug 2023 10:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD06EC433C9
	for <linux-firmware@kernel.org>; Wed, 23 Aug 2023 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692787979;
	bh=060NCc+jxDFScmMkEvdeHjgV7tCwLF3l6znOCocMX8U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JqQ4SCIWg3ZEHb+ivWW7KLiCz60zOQdxaL/njdQsO9Udd5uVJN7nAD7pb9smJtbD1
	 tvccgIYDTCEhRws2Bmnd81D2AsQZ/P67wutdIr0B+gDzfKu08w27RrqDkr9QWIvtBI
	 uDtjYowk0BPqlVMiL+lTcvQpQVb4rpIC98YjgtndflwTio1kTTaInFuQtKHZoEgkdQ
	 pfRqyD9eFF8JmyTeBWuE5j9Rob7OaQ5S+7BT9my+ORxxVV3BiKxCXovgPSvaqxrr/5
	 3WesMslgxbMcAgUEvbztnD03sOUyPPwuDlWjZpfbRLgUkFaBiSvokpvkza0hP0FBr8
	 Li/gAWn1gmeWA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58dfe2d5b9aso74255377b3.1
        for <linux-firmware@kernel.org>; Wed, 23 Aug 2023 03:52:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YzIPDSdpIlXyiCea0lzzpDmoZoh6GMqW5zMxMiy7vFqadNljxKk
	1jrNCeoEd1DU3LDVtbxVj7d5/W1DiXqvgY/WIds=
X-Google-Smtp-Source: AGHT+IE7XzAWk6pQ0xvgrXWwamncm/vYI5YIpjEdNxyqHa/nohLePvUq5RvTx3ALMXjjxXC1oJIvO8xMzvgrXeqPrtk=
X-Received: by 2002:a81:5248:0:b0:579:dfc5:20cc with SMTP id
 g69-20020a815248000000b00579dfc520ccmr10854908ywb.17.1692787978691; Wed, 23
 Aug 2023 03:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230809094059.595680-1-juerg.haefliger@canonical.com> <20230817093919.43580b46@gollum>
In-Reply-To: <20230817093919.43580b46@gollum>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 23 Aug 2023 06:52:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5QZ0Wz57Usvx+9quiHQdd8aS7UOx+xvTkaGzWsgjf9Zw@mail.gmail.com>
Message-ID: <CA+5PVA5QZ0Wz57Usvx+9quiHQdd8aS7UOx+xvTkaGzWsgjf9Zw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] copy-firmware: Introduce 'RawFile' keyword
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 3:39=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> > Not sure if introducing a new keyword 'RawFile' is desirable (or if it
> > should be named differently) but it fixes a couple of issues as detaile=
d
> > in the commit message.
>
> Anyone?

I'll be going through the patch queue later today.

josh
