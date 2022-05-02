Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0970C433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  2 May 2022 12:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85EA8C385B2; Mon,  2 May 2022 12:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE72C385B1
	for <linux-firmware@kernel.org>; Mon,  2 May 2022 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651494333;
	bh=Q5N8AB0ed4kD0MiQq0l3WBMJ12MFhSRZwLwDmdWFuZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GyNg6qGF20Yq0sAogTPtb+7lRg7sOQyiAjgciTSzkju5OsadwohQs6175+3k8nJIk
	 YwAFyBaxdJBoM+LyPsUNY7cgvJdwruRRWha43kIGVPgL4GChsT2bSvCQj9zhtHwn3k
	 i0RKi9t31MP6NJ3rcpON/zMOfQ334sKcSY/zubiOuUTYzkiRoStmwEuJzBfNJTxmX1
	 YWttq63gvI0Ti9Rd4ALVsTEx81aKmd9d8Bow0eV76oDy5UQfzAmXpDbSDUekghwOXU
	 aTiCxw+XA3PULwyBFYq6QPv+DMrG5ZU+cFChSUGmuhgfaaDX6MmUsFhJQFckS3ea3K
	 0317u3iGMqb1Q==
Received: by mail-il1-f173.google.com with SMTP id s14so1592654ild.6
        for <linux-firmware@kernel.org>; Mon, 02 May 2022 05:25:33 -0700 (PDT)
X-Gm-Message-State: AOAM531V79/LkBQ1TNRFx7T3NSa5EkMIQpH5P2XyY9BIiQbgK/Juadbm
	Zow4QiNP4rEimgD3kVsbshH7WK5gh7EqzN7e70g=
X-Google-Smtp-Source: ABdhPJwlj98O1zKOazp2wJmmSm/2OAf+OwCe2PIQxPH7+QbTXimQI0U11ZKYB4Z9h9AXEcj+mHRVKzxpLKSyYTcBg3U=
X-Received: by 2002:a05:6e02:1ba1:b0:2cf:232b:aa85 with SMTP id
 n1-20020a056e021ba100b002cf232baa85mr594564ili.2.1651494332486; Mon, 02 May
 2022 05:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <40254b0dabfd4b0c8f345d345325853e@realtek.com>
In-Reply-To: <40254b0dabfd4b0c8f345d345325853e@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:25:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6azvehV25qK3RthkpY=wp7z+zCHV45DQurKkvqQtZOJw@mail.gmail.com>
Message-ID: <CA+5PVA6azvehV25qK3RthkpY=wp7z+zCHV45DQurKkvqQtZOJw@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 4:49 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> RTL8852C has been supported by rtw89 driver, so send a corresponding firmware.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit e7d3d08c72abd1a2e57cf93b626b5b835b262dca:
>
>   rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C (2022-04-26 16:15:42 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to e7d3d08c72abd1a2e57cf93b626b5b835b262dca:
>
>   rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C (2022-04-26 16:15:42 +0800)

Pulled and pushed out.

josh
