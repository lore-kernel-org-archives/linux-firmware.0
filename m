Return-Path: <SRS0=dlzK=WP=gmail.com=samk.threatsecure@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B28EC28B20
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Mar 2025 12:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44C5CC4CEE5; Fri, 28 Mar 2025 12:44:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F558C4CEE4
	for <linux-firmware@kernel.org>; Fri, 28 Mar 2025 12:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F558C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e904f53151so18804876d6.3
        for <linux-firmware@kernel.org>; Fri, 28 Mar 2025 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165884; x=1743770684; darn=kernel.org;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moGOXtzGTaM6eV+OHAU8T/NHvM3vgiOBdQnjQx2gt7E=;
        b=B/PScne5y9iKkQd7If24lbO/0QjVPgx/Pjm2JcomnGlZtiwLXrfzcydZEGAmKUpzK4
         mSJN7rCQHOFyYGC0d6AF532MGWlGWZCJaerCxQX4UxSwNOIMnt1QmWFq9jYNWe2LBq6q
         6zHtxWX82TOkCQkCIaa03PXTV36UHhbU6V4DwKrb1pT5UgH6LNHQykVrR2NU4cB4SYgX
         8pQu7ZR3lfAITa2UNeq6If0B6aiZ/6NzACm8/dpfOzbktPRIRGeUW+Vc1T1zPmWj7pXi
         jIEH0ClOYFk1gUTcuuRqynfZKL1dWM0tGSkWRP/hJ0edVL/zAaQg69am/mIKh/+RDMul
         f7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165884; x=1743770684;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moGOXtzGTaM6eV+OHAU8T/NHvM3vgiOBdQnjQx2gt7E=;
        b=Bd8jXcBp1QoVvHSgyfGnZasIvg29SRXoENFbmSNwqBPtXICc30qUM0pN4Xouh48Q0X
         7uWQem0hJ+FTCXg3LPl2mWQn3DmLTbIkasK3B4u3z8tVqlanKuqVt0DA+U+QBBah7npS
         9e8L1XfG8PKZpPrs1LD6oBJ28BDWd17bs0fTHAF5J7ByldUz3A2O38bFZ4BNXNapIXiR
         u6c3zMqA/0o2B53Ml7BahJ+E1CR0dhH2YDkQfTFrxk4NAuE1vDo254d2od5VBVGKyQTf
         PFy6d/lucn6RZjavFHeDrjw+bx0Nm+bpVb+BtAG0jOQbOUV0fW5+rEb7ebWMUP4xhwxj
         /T9w==
X-Gm-Message-State: AOJu0YydMoEzQlJdTRcCjO8xiltvnN7mSSd6PCYCsRIA1DqObCrIWw+1
	FVwDAeGB2IM6TvwKd1S8lxIV1tj1dQXEhkamJT49lC/cyWbZkaC9pp/J7w==
X-Gm-Gg: ASbGnctm75ooY0rF4QJ+LwADqeWDeuU0v/aESoXtJVSNaSETmZHu8T1ErKYnvogPW4q
	/m9ValpcASEJf3iosaSkPhPUigMfcGqHzBWexYC9zCmVeDtfxu/Pgs66Zz2WzpRt0h2byz9AUE0
	pza3YJovsn7e6dyKQvnxwiRsrxQiR8qLbVaQmG6e14wKFdwJF8xAhnqHtRyNxrk47akxcmydMnM
	knvA1L3UQvCLjyhxuBnH5O9TrEdeCy7oPafzpWx1PB3B/uJeHzWtJnnkztywzq03bqYD+b56e2J
	t367ZYSTdiEaWkMwmENFU0Lpcx1L+wOrj2JqDjk/BOwmid+mmvyyGBGEj5wCoWI8FtS31mjWqrB
	Mss3/c6gi7hlOqi9qSWUJtc8SL6YB/dDIUJ/I0B7JOPbEvsh13B8DuR4Lyq/l8H/UoKspA8Zwsw
	==
X-Google-Smtp-Source: AGHT+IF+mqyq8kD0Cfp1C1K30QQRFXKlDockMe0Xt4LzMSablbp+/Ef6+QCgk+FLiMGFUnqoysXgnA==
X-Received: by 2002:a05:6214:acb:b0:6eb:2f7a:45c2 with SMTP id 6a1803df08f44-6ed23946a36mr74193566d6.43.1743165883778;
        Fri, 28 Mar 2025 05:44:43 -0700 (PDT)
Received: from a26d410b-bd73-4a57-90c8-52492461d5d4.local (ec2-54-224-243-28.compute-1.amazonaws.com. [54.224.243.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771dc8sm10516916d6.78.2025.03.28.05.44.43
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:44:43 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Message-ID: <a26d410b-bd73-4a57-90c8-52492461d5d4@gmail.com>
In-Reply-To: <999bfe87-2923-4fee-b525-6e36f6f0406d@gmail.com>
References: <999bfe87-2923-4fee-b525-6e36f6f0406d@gmail.com>
From: Sam K <samk.threatsecure@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: kernel.org
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Mar 2025 12:44:43 +0000
MIME-Version: 1.0

Hi Team,

Just bumping this to the top of your inbox!

Looking forward to hearing from you.

Thanks,
Sam

On Wed, March 26, 2025 =
11:39 AM, Sam K <samk.threatsecure@gmail.com>
[samk.threatsecure@gmail.=
com]> wrote:

> Hi Team,
>=20
> I was checking out kernel.org and spotted a=
 few things that could make your site a target for cyber attacks.
>=20
> Do you have any kind of formal/informal bug bounty or reward program for =
researchers to find and report security issues? If so, please let me know, =
and I'd love to check out the specifics see how I can help.
>=20
> If not, please let me know if you=E2=80=99re open to rewarding =
researchers for valid vulnerability reports at your discretion.
>=20
> Cheers,
> Sam
>
