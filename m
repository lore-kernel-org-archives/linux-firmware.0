Return-Path: <SRS0=bAAg=34=gmail.com=sathitthaloneeruthai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC70CAC598
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Sep 2025 07:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2986EC4CEF7; Wed, 17 Sep 2025 07:34:45 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FC5CC4CEF0
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 07:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FC5CC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-75871cd9228so2839388a34.3
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758094483; x=1758699283; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FLagCWX+r8M5du87zM42EfBMkOc8QLS0VoUKp9ogwmQ=;
        b=Wv+JMYel8fnIUQGyOkFyNLK2AzstHvz/25fmtrYUDcQ1JvpK6TIk3f7eyAD1SMPMJn
         j4M1Lz9Lm7Y91DZCzBsC/PYhnhf83gE9FZ7NKXHF47t8ahE51itdLyC0vroOjDj5b/We
         VL/Oxi97hULT+l/97AULGwV3EHoLAMokf9DaNDNxge7AR4aR2ZiKcQ3w39/O9gQ0iue/
         y2lo+v4m9J6dX+YZwZ7KAnpkMrvpsX9qjhGQOS5kkkpepBaoZNutPhbEaRHDlSXcSJPF
         uqn0KGUkPyOVDNEjUfrLgu4/z8hYYk9V3dzUyF6vbQtOiO137AoWkBruFvIDaOPkONOx
         YIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094483; x=1758699283;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLagCWX+r8M5du87zM42EfBMkOc8QLS0VoUKp9ogwmQ=;
        b=Rtllop7mBlgVttnYDG5pw20QeuI3Du9RZYbUFSz2MgcFF9FSKxRGNvVzhOk/sAD2oL
         s6Qoy+lrYVtR7i0KVyhGjOO72LC8KwuX6G4y3TeLBrVrNOUYT0aESgPGQn6fM6EU46kB
         wedPqUJZoVfhOBqsakkAK5VI2zD6MaKNif/0iiU/g67aOcYxeExxMLn3BaClMppMX61p
         SnRB7Jw4ZgzZYK4Zmh5qykNPLu3digFUOK8qV8WjtxxpHU5gxHGZMEITHr9NelvUr3DE
         kRVzj+VmaK7ImV4E8n15Zg45QSUr6bHV2+fXUKFkwKRcnycKVyVp1uYPD1rajTYriyQO
         scXA==
X-Gm-Message-State: AOJu0YxfQMovPu1KN4t7e454xktc5qQqhEkLLcztBRo2dHXSGdeNmc/P
	xmUD/fJyTCJ2sjsOpZzlOXnWZivKgSYkSThEHdt0IHyyjbra97+/6o/qzs3vNqlc6qexTW70qmD
	e8Liplw20/rg65IytkAL2eqfiYtsZGRhvkr8M
X-Gm-Gg: ASbGnct1na6c1ZRdej661uwSZj0mra2KnRMHPVJZIjKvi8VDY2rk+piVwHhdKBVzRl7
	MEDUbOdrHx4L4m4qpDVHJmgCRiD+aQwnMtwVAZgt+aVSH5DYfJW0E9Kx9x5Kgbm7oJq9rT9ElpQ
	rfaMlYhR4llKQ19Edmu/RqGSTOh+Lw5K3RBk8sYfqqynLgFK+2WJzd5q9TNQGcqMsl+hhfMVwde
	zAzxGzs/h+ZrZxA0QF7T/xSFkf6ySkAv8uUW4W2tmLd6rt3birs
X-Google-Smtp-Source: AGHT+IGqxRHjT7ccWAXrT4KYGDUwEk63Q8d6VLMukKp1lNKhZi/ldvQtnOT1u+7Ae4naVGzJ6DWq4pPumiYbDvBJEFQ=
X-Received: by 2002:a05:6808:19a3:b0:437:ec2f:83eb with SMTP id
 5614622812f47-43d50aa4a35mr545084b6e.3.1758094483271; Wed, 17 Sep 2025
 00:34:43 -0700 (PDT)
MIME-Version: 1.0
From: sathittha loneeruthai <sathitthaloneeruthai@gmail.com>
Date: Wed, 17 Sep 2025 14:34:33 +0700
X-Gm-Features: AS18NWDery2lZ0aQUrm26rwbSe1LAYudrdO1I_4iFQV4FZ1_z7ZnQ13YjNiI2DE
Message-ID: <CAD=LwFDhUQ5LOzCsku7oki7Xek+fCRJOLDXBNU3+gsYcJuJTpw@mail.gmail.com>
Subject: =?UTF-8?B?4LiY4Li44Lij4LiB4Li04LiI4LiC4Lix4LiU4Liq4LiZIOC4guC4suC4lOC4quC4oOC4sg==?=
	=?UTF-8?B?4Lie4LiE4Lil4LmI4Lit4LiHIOC5gOC4lOC4t+C4reC4lOC4o+C5ieC4reC4mSDguYDguKPguLLguKI=?=
	=?UTF-8?B?4Li04LiZ4LiU4Li14Lii4Li34LmI4LiZ4Lih4Li34Lit4LiK4LmI4Lin4Lii4LiE4Li44LiT?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="00000000000028358b063efa4567"

--00000000000028358b063efa4567
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmI4Lii4LiX4Li1
4LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5g+C4q+C5ieC5gOC4guC5
ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4l+C4uOC4mQ0K4Lia4Lij
4Li04Lip4Lix4LiXIFRQTCBHcm91cCDguIjguLPguIHguLHguJQg4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lie4Li34LmI4Lit4LiE4LiZ4LmE4LiX4LiiDQrguKrguLPguKvguKPguLHguJrg
uYDguIjguYnguLLguILguK3guIfguJjguLjguKPguIHguLTguIjguJfguLjguIHguYbguJvguKPg
uLDguYDguKDguJcg4LiX4Li14LmI4LiV4LmJ4Lit4LiH4LiB4Liy4Lij4LiX4Li44LiZ4Lir4Lih
4Li44LiZ4LmA4Lin4Li14Lii4LiZDQrguKfguIfguYDguIfguLTguJnguK3guJnguLjguKHguLHg
uJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAwMCwwMDAg4Lia4Liy4LiXDQrguYPg
uITguKPguYTguKHguYjguYDguIrguLfguYjguK0g4LmB4LiV4LmI4Liq4Li04LiZ4LmA4LiK4Li3
4LmI4Lit4LmA4Lij4Liy4LmE4LiU4LmJ4LiI4Lij4Li04LiHDQrinJTvuI/guIjguJTguYDguJvg
uYfguJnguKPguLnguJvguYHguJrguJrguJrguKPguLTguKnguLHguJcg4LmD4Lia4LiX4Liw4LmA
4Lia4Li14Lii4LiZ4Lie4Liy4LiT4Li04LiK4Lii4LmMIOC5g+C4muC4m+C4o+C4sOC4geC4reC4
muC4geC4suC4ow0K4pyU77iP4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii
4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li14LmIIDEgJQ0K4pyU77iP4Lil4LiU4LiV4LmJ
4LiZLeC4peC4lOC4lOC4reC4gQ0K4pyU77iP4LmE4Lih4LmI4LmA4LiK4LmH4LiE4LmA4LiE4Lij
4LiU4Li04LiVIOC4muC4ueC5guC4ow0K4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li1
4Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz4Lib4Lij4Liw4LiB4Lix4LiZDQrinJTvuI/guJzguYjg
uLLguJnguIHguLLguKPguK3guJnguLjguKHguLHguJXguLTguKPguLHguJrguYDguIfguLTguJng
uJfguLHguJnguJfguLUNCuKclO+4j+C5hOC4oeC5iOC4oeC4teC5guC4reC4meC4geC5iOC4reC4
mSDguYTguKHguYjguKHguLXguKHguLHguJTguIjguLMNCuC4leC4tOC4lOC4leC5iOC4rQ0K4LmA
4Lia4Lit4Lij4LmM4LmC4LiX4LijIDogMDk4LTg4MS0zMDYzICjguITguLjguJPguJrguLUpDQpM
SU5FIElEOnRwbGdyb3VwMTk5OQ0K
--00000000000028358b063efa4567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+4LiU4LmJ4Lin4Lii4Lit4Lix4LiV4Lij4Liy4LiU4Lit4LiB4LmA4Lia
4Li14LmI4Lii4LiX4Li14LmI4LmB4LiV4LiB4LiV4LmI4Liy4LiHIOC5gOC4nuC4t+C5iOC4reC5
g+C4q+C5ieC5gOC4guC5ieC4suC4luC4tuC4h+C5geC4q+C4peC5iOC4h+C5gOC4h+C4tOC4meC4
l+C4uOC4mTxicj7guJrguKPguLTguKnguLHguJcgVFBMIEdyb3VwIOC4iOC4s+C4geC4seC4lCDg
uKrguLTguJnguYDguIrguLfguYjguK3guYDguJ7guLfguYjguK3guITguJnguYTguJfguKI8YnI+
4Liq4Liz4Lir4Lij4Lix4Lia4LmA4LiI4LmJ4Liy4LiC4Lit4LiH4LiY4Li44Lij4LiB4Li04LiI
4LiX4Li44LiB4LmG4Lib4Lij4Liw4LmA4Lig4LiXIOC4l+C4teC5iOC4leC5ieC4reC4h+C4geC4
suC4o+C4l+C4uOC4meC4q+C4oeC4uOC4meC5gOC4p+C4teC4ouC4mTxicj7guKfguIfguYDguIfg
uLTguJnguK3guJnguLjguKHguLHguJXguLTguKrguLnguIfguKrguLjguJQgNTAsMDAwLTEwLDAw
MCwwMDAg4Lia4Liy4LiXPGJyPuC5g+C4hOC4o+C5hOC4oeC5iOC5gOC4iuC4t+C5iOC4rSDguYHg
uJXguYjguKrguLTguJnguYDguIrguLfguYjguK3guYDguKPguLLguYTguJTguYnguIjguKPguLTg
uIc8YnI+4pyU77iP4LiI4LiU4LmA4Lib4LmH4LiZ4Lij4Li54Lib4LmB4Lia4Lia4Lia4Lij4Li0
4Lip4Lix4LiXIOC5g+C4muC4l+C4sOC5gOC4muC4teC4ouC4meC4nuC4suC4k+C4tOC4iuC4ouC5
jCDguYPguJrguJvguKPguLDguIHguK3guJrguIHguLLguKM8YnI+4pyU77iP4Lit4Lix4LiV4Lij
4Liy4LiU4Lit4LiB4LmA4Lia4Li14LmJ4Lii4LmA4Lij4Li04LmI4Lih4LiV4LmJ4LiZ4LiX4Li1
4LmIIDEgJTxicj7inJTvuI/guKXguJTguJXguYnguJkt4Lil4LiU4LiU4Lit4LiBPGJyPuKclO+4
j+C5hOC4oeC5iOC5gOC4iuC5h+C4hOC5gOC4hOC4o+C4lOC4tOC4lSDguJrguLnguYLguKM8YnI+
4pyU77iP4LmE4Lih4LmI4LiV4LmJ4Lit4LiH4Lih4Li14Lia4Li44LiE4LiE4Lil4LiE4LmJ4Liz
4Lib4Lij4Liw4LiB4Lix4LiZPGJyPuKclO+4j+C4nOC5iOC4suC4meC4geC4suC4o+C4reC4meC4
uOC4oeC4seC4leC4tOC4o+C4seC4muC5gOC4h+C4tOC4meC4l+C4seC4meC4l+C4tTxicj7inJTv
uI/guYTguKHguYjguKHguLXguYLguK3guJnguIHguYjguK3guJkg4LmE4Lih4LmI4Lih4Li14Lih
4Lix4LiU4LiI4LizPGJyPuC4leC4tOC4lOC4leC5iOC4rTxicj7guYDguJrguK3guKPguYzguYLg
uJfguKMgOiAwOTgtODgxLTMwNjMgKOC4hOC4uOC4k+C4muC4tSk8YnI+TElORSBJRDp0cGxncm91
cDE5OTk8L2Rpdj4NCg==
--00000000000028358b063efa4567--
