Return-Path: <SRS0=o4hI=E2=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC872C43458
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A325E1F000E9; Tue, 30 Jun 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782815840;
	b=flhQEegCfU9GgUIo8hsKPeG4C91HK8wcooubVlueIJlZ3sZqa2HM5sp4gxJFYAWUDi7s
	 KgAJpdBwIHtDXmpXaHCnEiDR31bBlpn3APMs1N3kiWSHhozeZwfrEgU1ejvqfFL8mWFQT
	 eG9QZq9K1/32OHKPC1rXpOD1yKT6U8O/F6mHQHkoNnmpne2hIvOaa0PXuLWvW/ruDUEZV
	 0Mr6SbmKf8eQeBOkC0ssi5lu/CxHWKD5P6y5hFB65EBr2iL2RRwnwU3+8vTag2tU+wM1E
	 gQbupUQkteUBlDoAqg4svkcIx05+S5JVPlPtPr0PtusSRq8MYPivMYXCrWZ8RRWbF1g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782815840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:List-Id:To:Cc:Content-Type:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zuQnj10eTe+3N+E+lbeni1RN79jOQ9Zsnqsl4Kmct1M=;
	b=JhtTHfHUNI8avfZ1Ws8s0hAGKfxgpzROA8nLar0YaKeXbNSNugzdUVXGzhnO+Sil0CEE
	 OcGNPRfrkjUsfRnFCMlk2p4owxn3ZdkJIJkix1vPlOZuchhKgbDhnagjrDy/ZHzh5wQYm
	 pAnvpLcWZn3XvEzlKxGkHHo0DuWJgGXljRXM4JQheVf0xApbobVMTYedxSjCKLeE2cb0l
	 JroD9D2l7ig64aK+d8GDvxnVuzxUozai8MEs9y1OzEacmVVFlT6TgawwnqMjwqFyOBP0R
	 s1uVP0/tQbEGFkXMUOkjcywUhhdbJWLfrruqhP27v3cBXRLQHLilP9A3b48VlpeAcRw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XfkAWHV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxJi8Q62;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA6831F00A3A
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XfkAWHV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxJi8Q62
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DA6831F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mkhS1602532
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 10:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=zuQnj10eTe+3N+E+lbeni1RN79jOQ9Zsnqsl4Kmct1M=; b=Xf
	kAWHV5ClZcdyrDbH0hvnXLBnYc5XcCdG8iOe/NTaYQ+CT7rIlR0L1OXORal7UBqO
	6HfMaKwss/NJNbtv6AHIHLuJoL6YmyuzCiStr15LGJQjvjhReD4aspnxTM/KevA4
	SJt6y25lKpmi4UBrNgALQRcV9HzWLaA00ELjw2791GnxZ9pZe4+3nKr9qdbIhZS1
	Fd3d8i6meVjx+/WYy8InulMjaI04pqSX6aWDn8ZNZBafsrMp2rIbND5xUZdR0Bwp
	OsOMQ6hi1YDxtOf9cNELQn2E3t9Ja8rNWSUvPolDtgZ3GRtIKo9mFyYCVcU2Fua0
	XzYWE6tet31rzUD9kSEg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprdrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 10:37:18 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448bb8bcf38so1739116fac.1
        for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 03:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782815838; cv=none;
        d=google.com; s=arc-20260327;
        b=CvAYadReVotwwBTZKL+9FWiqadVizVSQjk67c76D4mOvvVKaI/U58AhmD4ZPPjw/2L
         Yh4FYVAjzVpcQEn67kihFErFMadd5PTr299E8cy66PtdULF3BHPhJbR6rPus386BglAg
         KNDqbfdm5ODBHeHQmqRCybc9YAHxIKPI72fikaQzHL93UISboUhsxwZDpu8t6tYUZ49Z
         jXPD5DRqfTbZmLjsL1r5TVaOQ+/xd3TMcH5PTlHpFlZUVJaXg0oH39D7Wa7OiGNJqZVz
         rYShxvoY7TL8IcsJXxmxkwGB1ijxd3iB7LhMvdxsf6JXIlybnnwD+v021Qqeu+UhpEEP
         5Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zuQnj10eTe+3N+E+lbeni1RN79jOQ9Zsnqsl4Kmct1M=;
        fh=EKSydvufuvQV/GaJmjRewt1/Txqcw0J6koAhIbsa97I=;
        b=qR0qDfeUkK12D7GsQx6nBEobOfmBtb4/BTyOShtuZ5+brGAa8JQtemfYh5jCZJfdIB
         RNpyyoG0jbRcH0JpOnLlGvCXMIKGl9IOkGNs+cfbTtncDh0yTzfZy6NKQbTpKz7NjVkb
         t5ahQPGSXiWq8Y3cJMlxMIHNiboFV1J1lieVLwgxv/JkO9IuLpTjjv7ee00AnSFaB1Hd
         +7JjaMN1WmXglEKHFEXAaepxepvlY774m9+YuNvKaC2uqXpL8mwQkzPIFADc3Mv7RZD7
         QGMQ37MvDD74bKFcl0cfHaBug2EuyJa9IiQpylNeUMGIL23GWur9s4ZPdJqyFiUpmpvr
         vo3A==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815838; x=1783420638; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zuQnj10eTe+3N+E+lbeni1RN79jOQ9Zsnqsl4Kmct1M=;
        b=jxJi8Q629jCXDbZP8YgwBvcUtYS+tbOv3n6bG2ZlKT7gTwiauc6gRlv7A40LqgKTVV
         bNazk2ksmNQFRFcYiKoFcGBVmujgeswCarSXbeKUxzHg9TZa3CClMkArAUlE2XVRy4u8
         hhC5ETQoAX9OhcyfOkrWqfaL7+EB0/gF/xQfEEH9KcwbJwqmjSYtIinTcztkZKvKo464
         n2Ai/cYK1cT07N2p3tWNLOffytG6AbDMNZRR4yxyCDNgxfVMg3n4pwMWJuiCWWrirBCS
         7EM8qaMiQt0fh4lX9j6HZ8Le4KfNSKqhoe2ycaLwstfdj7YsOnBB3u91hRJjGUm9+bI0
         rtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815838; x=1783420638;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuQnj10eTe+3N+E+lbeni1RN79jOQ9Zsnqsl4Kmct1M=;
        b=HDZ0RQKeo6dRjJJ3GsfdK+FcADaNGQnieEla+KiCR3XgsEbRa0XtzkhRD/DZtTc6hE
         oa7ca9T3y0C64zsPbtAx8zNAA4hkidUKd04bICJ4Fcm3FkqYYU4HdDNH69IYdNFie1hL
         2fZeOg+l+wOB5LFSjfMRTlNVKPzqU05kv6OQvBkpm4/pm1NVlo6CLep4t8ExFAinHeqd
         xw1+VciHte/rjusvwRJxECA0+Cpjb+jpn3RmRistVa8Q1QjjKkCLQx7S7HX7erk4G59D
         U5vhC8Bx4YCU3KS1adGJhmIznis4KDIAltYU5LLN5ISCDHNvnw56RhCdrITqG8E2DSWe
         zjtA==
X-Gm-Message-State: AOJu0YzJsYvIgvTFn+Kf/kdTflNdooMQU/WtJ4ljqayT8k35twsDiBaj
	BLkqSAtNK829WWhS752peR6LW7dznq60AbNlCiLdY+WHx93y2KCwHaBgbdP0iA4coTprBB+2I+G
	ssfamdy08rKacmT9DRqECmumVpUjOeI/kd5d0IBmmP4hK7Coe034Q0SefXsWqvt0WVuKDOtDW55
	6KjYvz08OpqE84xzpkF7KNBnCFJZZG5mkjZ9W453DfQ2CfbK2/ShyFkltH
X-Gm-Gg: AfdE7cmIHhd4pxH2eqHOcnFprjcuah1NlOB4SsoV0KWLU7v2H0psfUYWN7bn1VZGJgB
	EeT4LIyZ4oJ+ZE3RpRnnX2zxotvU1Fnq2l6G78OS6bzmcDiR+dunISjCLjeBaYmrZnepsWRFKPE
	H1sAQ5FrDKY6Z1IOmMwc8yRMfkhnrYXUg+CyB55oe3eXbmD7eV3nLA5w==
X-Received: by 2002:a05:6820:80c9:b0:6a1:7d5d:d560 with SMTP id 006d021491bc7-6a189286c70mr2247567eaf.60.1782815838202;
        Tue, 30 Jun 2026 03:37:18 -0700 (PDT)
X-Received: by 2002:a05:6820:80c9:b0:6a1:7d5d:d560 with SMTP id
 006d021491bc7-6a189286c70mr2247552eaf.60.1782815837850; Tue, 30 Jun 2026
 03:37:17 -0700 (PDT)
MIME-Version: 1.0
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:07:07 +0530
X-Gm-Features: AVVi8CdEN-hRVttrdFXKU5FjPAResM2ez7w1RoqtVeSvCR20o2ZjRpEFjmCpCGs
Message-ID: <CAPgfiAHDaL_7=p_z_qYi-Y_Ct9rVJAaY7SoYBh2sd0eEXxGmMA@mail.gmail.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000b71cf2065576284c"
X-Proofpoint-GUID: Ub9ZjE4ryAEQgtq6f565_lelF0aU8UtN
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a439c5e cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=Acl2IZy6fUtAgdz3uxIA:9 a=QEXdDO2ut3YA:10
 a=QqGDRJIqOwqtC4NwzqwA:9 a=1zu1i0D7hVQfj8NKfPKu:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX1tSgzLwzqzI4
 m5rfLyK+muBGvaeSGbssVGFUo8YxUnkFKow2gC12B8TX4TY28J5ud/GJOcf64fk2oQLiJj+MPbc
 kg6bzCmGq0ZcuUyz4MtToRF9bjDKWHtHEJrRoAE8bC+fsA/etZCQ1iI7+5avbmGp69V0naEcuKL
 /lwA9nPeNkDgD4kZvxnpggTTpv/kdKsMwZl7AQdsqmFzKXE4cmV7iUnV7gWtE2/FnenO4Q2KDjL
 ie7RhI61NSW3FpWEjSYWAHW5r6gTjJzmTh43di4OvZgwkarBo2GH7VkA7mll68xGpJ9lRXNpu3H
 TcJNTWKLa1aazjgVgtZQlZ8EhA/YshRNi4gNfmvx02PGlrXdceZMgt5KJCsNrjtD7R4Yitecq9B
 STWT0dkEsWIPlzTBm+3DriXJEsqYWy3Qu8uPwtJiAD1odkJCSm7V6hrkbQvMyaBEXWZ54wNxw8x
 LIdXu1zJy+vSgzUtU8w==
X-Proofpoint-ORIG-GUID: Ub9ZjE4ryAEQgtq6f565_lelF0aU8UtN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX4QqGviH6rNoK
 8zN5XirzqOhF3tFnKrwqdW+GclKwCGNF83xEXc2M0Cb8/Eivb6XKydfdzoZf1gqyXo0TWeBDxvq
 CX21CGYeYQIxuRC1dT+xG0Ah4050lAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

--000000000000b71cf2065576284c
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:



  Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53:01
+0000)



are available in the git repository at:



https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
modem-fw-shikra6



for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:



  qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52
+0530)



----------------------------------------------------------------

Srikanth Katakam (1):

      qcom: Update qdsp6sw firmware for shikra platform



WHENCE                      |   2 +-

qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes

2 files changed, 1 insertion(+), 1 deletion(-)

--000000000000b71cf2065576284c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-s=
ize:11pt;font-family:Calibri,sans-serif">The following changes since commit
1bd9b36771d9087ea76588812995587fc0024245:</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0 Merge branch
&#39;robot/patch-0-1782476710&#39; into &#39;main&#39; (2026-06-26 15:53:01=
 +0000)</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">are available in the git repository at:</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif"><a href=3D"https://git.codelinaro.org/clo/linux-ker=
nel/linux-firmware.git" target=3D"_blank">https://git.codelinaro.org/clo/li=
nux-kernel/linux-firmware.git</a>=C2=A0 modem-fw-shikra6</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">for you to fetch changes up to
396aad69556b121575078264d3c59661ccc53744:</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0 qcom: Update
qdsp6sw firmware for shikra platform (2026-06-26 22:26:52 +0530)</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">---------------------------------------------------=
-------------</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">Srikanth Katakam (1):</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom: Update
qdsp6sw firmware for shikra platform</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">WHENCE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +-</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -&gt; 570=
9176
bytes</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in;font-size:11pt;font-fam=
ily:Calibri,sans-serif">2 files changed, 1 insertion(+), 1 deletion(-)</p><=
/div>

--000000000000b71cf2065576284c--
