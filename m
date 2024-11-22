Return-Path: <SRS0=9CQj=SR=gmail.com=thirphattt06@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B967D75E32
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Nov 2024 12:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05482C4CED1; Fri, 22 Nov 2024 12:11:37 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D267C4CED0;
	Fri, 22 Nov 2024 12:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D267C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e7b704b7e1so1525437b6e.0;
        Fri, 22 Nov 2024 04:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732277495; x=1732882295; darn=kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6LU5NqN29Gru8BfOLQuBCel+Sikavthh/CeQJBzL3k=;
        b=j3xz5WrlrH6onrGeL144wogOtVQh72tzKLumER8kWGxuS6WN0cYrEUBwAlCkAYWYd/
         HBNZZR+qW627J3AUuAS4+VqJfpmAIJ7oJ1Aq7R0sn/sj97ZHZ1JrJk0hQenV3D6IR44N
         rF5tHzdh/SxCdEgkKlRyNZoS4dCAupKWrw/ZDZWTuzYo2NI1JXO+eyFVDB3HssZgis5U
         uxNftdM74X6O2knx3p2qSH3EW4Vci7okosP/k98r5ZNjV88aIW/LBIeKlXadv5S1GW2s
         Tl0H7rdrLGS+jlQ2eZLJFRXGaXnl2mr3WkLJrwVG7jQiQpFKzYOeGgqPzs5wPfZv38/U
         P7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732277495; x=1732882295;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6LU5NqN29Gru8BfOLQuBCel+Sikavthh/CeQJBzL3k=;
        b=wc4/A+dpEdG1hSonoNoUJDunefoEQEYUboNq6Ou1EsHIVuIL7dP2D+Fru1nPxPa1Zn
         P1jQqqq2eS4LSJBhg/prJFmgxBkjVcnH+LdJtHTPq7J/xDMg6FiLggr6QaJ6aQ3Ofx4x
         f9KDDUBj3jCtWCwORL29efKmPEvPQmySq9a4uItjVwpBNGfF2IrfjT+mSeS8qES1Jcc3
         Z3m7/M/LzI2f0LFU7noDgBPVsYykoZRO4zCFxdjj9tDtcRYAf5JDrIpUasAXXcCuQTtS
         afZmjDh1xYyNkyJP8likJbftnlNNHqKoRlzDELt/zO2Fk22Itz7PGIlIidl5bztBzlS/
         M36Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuYMU4qoYw1j3Um99R38IgZbSOMZYVBGjpKfllF+WDiNW2JxJ9+MYQohfSAhEvREDmP3b+PnNR@kernel.org
X-Gm-Message-State: AOJu0Ywzv1yKj1qWRl5hkjhYjTIQUAyvVGjJz9DOC3jk4WSPuTs62eot
	WK2Wud9zPtlWVuR8rE4Vsi9ylLPaZx0C9su8Kru32D4ok2a9WyoOrkziy48q4ndkWiwu/QpIZgY
	Rm16YMu4iyVknqzbjApCCyTDeTB5Q/NSX
X-Gm-Gg: ASbGncuH5nRxmw32gpeWn6J6HdhvDDtaNs5dMYuhDxqAanO03kB9VnjKJTX7vjCuH2s
	zJcUay9doi1//lqPQiLrPryXh6R88bPDNTYj9dpTOCu4LANb+VRag4LaO6GvL4zkTkA==
X-Google-Smtp-Source: AGHT+IFOClrZah1Ec/1a4/VksFJN/9xZ+WJA1/K9ovGJFMAyC8VeS4V+TyaS6QudQYB3XQ2eM3L/uHZx1nSOxyg4i3I=
X-Received: by 2002:a05:6808:1789:b0:3e7:ac6a:2137 with SMTP id
 5614622812f47-3e914a7f5c0mr1375387b6e.16.1732277495128; Fri, 22 Nov 2024
 04:11:35 -0800 (PST)
MIME-Version: 1.0
From: Adrian <thirphattt06@gmail.com>
Date: Fri, 22 Nov 2024 19:11:30 +0700
Message-ID: <CADoo-mxbiQaxGOhRAEQAndRZ28PgAWhpZc_giAz8sBwNJ-mG9g@mail.gmail.com>
Subject: =?UTF-8?B?4Liq4Li04LiZ4LmA4LiK4Li34LmI4Litc21l?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org, thomas.lendacky@amd.com, 
	lvivier@redhat.com, aik@ozlabs.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4LiC4Lit4Lit4LiZ4Li44LiN4Liy4LiV4Lic4Li54LmJ4LiU4Li54LmA4LmA4Lil4LmA4LmA4Lil
4Liw4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiB4Li04LiI4LiB4Liy4Lij4LiU4LmJ4Lin4Lii4LiE
4Lij4Lix4LiaDQrguILguK3guIfguJzguKHguIjguLDguYDguJvguYfguJnguIHguLLguKPguYDg
uKrguJnguK3guYDguIfguLTguJnguJfguLjguJnguYDguJ7guLfguYjguK3guYDguIjguYnguLLg
uILguK3guIfguJjguLjguKPguIHguLTguIgNCuC4l+C4teC5iOC4oeC4teC4geC4suC4o+C4iOC4
lOC4l+C4sOC5gOC4muC4teC4ouC4meC5g+C4meC4o+C4ueC4m+C5geC4muC4muC4muC4o+C4tOC4
qeC4seC4lw0K4Lir4LiI4LiBIOC5guC4o+C4h+C4h+C4suC4meC4reC4uOC4leC4quC4suC4q+C4
geC4o+C4o+C4oSDguJfguLHguYjguKfguJvguKPguLDguYDguJfguKgNCuC4lOC4reC4geC5gOC4
muC4teC5ieC4ouC4leC5iOC4syDguYDguKPguLTguYjguKHguJXguYnguJnguJfguLXguYggMS0x
LjUlDQrguKrguK3guJrguJbguLLguKHguJ/guKPguLXguJ7guJnguLHguIHguIfguLLguJnguKrg
uLjguKDguLLguJ4NCjA2MjY2OTc4NzkgKOC4nOC4ueC5ieC4iOC4seC4lOC4geC4suC4o+C4neC5
iOC4suC4ouC4geC4suC4o+C5gOC4h+C4tOC4mSkNCg==
