Return-Path: <SRS0=63HA=ES=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB66CDB466
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 01:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D17521F00A3A; Mon, 22 Jun 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782092867;
	b=XgELacJaH5VqOR43SB6/KSAMfZkhBCPJbMxnAhf5sK5C0lAopi3/NjZLwG+Ay9Mya5Ds
	 dlpilY8nLnGyBS3O+3ff/qbQnuGQlvV7cz0kFAh5HTD87EgAi4I0p2S5i3MclKQxCEc/f
	 hdzSyFqihBYGgUGr8VnfjQruuy0MxRTboNjZubp/Xa2hCE7/CxgaHudionb9SbB3ohtVo
	 trjEmVFBnwotcqIdw+xExeb9wDkLH2KQoTWTA0qzN2XM/rzOMCdpX364cvsH7ywGkLn+X
	 dIv5hCgzzudAHXJFsvDINxWGdBj/EZa0LXwe9EBk2LvK+dUh3WSY/KbIKsKhg9n/i8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782092867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jSPD0Heo3WshvC/QYVNxpXbdEjOPyT6zRjhPcE3WmVk=;
	b=Ssev7ehEozdZIvhPOTFikjpvwu4qxaBqnT2s7Jup1LxSvJfuroar/daCMpkzFaIY1qqy
	 2z3gN5vMFrckWUxUiNoubNkc4/Hcx96VwhG6CD0waOwkznIw3vrHBuJ4U5ws7jaSWinw7
	 T1hlFmFDvH/hmU5HRWSDC+/+YiwrRYxIVXWbpAxXfaLFCbdqK3eQ3t5uYzbZMYFbdHfSy
	 piBg0qE+H//v92rYUx20VkGz1RtOqFAL3DpIghRY1ap/teTILA2Rb7D+YgqikX8rzBdl+
	 A1XUtJ680/aB5JTLab5jIlTpE6phQ+lEL9BdWJ/OL8Q/gzbmhP/W+zVYOGEOPZzZRSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ESGHDpiI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifIiZxOO;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C5991F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ESGHDpiI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifIiZxOO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2C5991F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LDtCfN1991140
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 01:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jSPD0Heo3WshvC/QYVNxpX
	bdEjOPyT6zRjhPcE3WmVk=; b=ESGHDpiIyKvQFQVFwGNU+faqctbtYPZIuhKj7i
	Yaz7ZQZYUh4EEmBeTbTV8U73aFvQeMwC/3YNXduXjMsP2F0ZHYMbMORn3gia+TT6
	B2UEP42GDHnUIccm/poEVBA56YqYJaaGWwFYxoI5brItGUHcRQ0lRlwlYxKj3iAP
	4Byca5CWnDKyTCIyXga8RcE1XPrnNAvm4JbVf5Khws5BVdmrD07sNocOK+8zUcKv
	rN2tWKvUYdbEsuPM+vklXHo5y/GISbTqgXWNKl4xOEg8N1APrhMF7RgiJ7zqB8MQ
	3RK2uXHyTA06k6gwPccgxC2w2BdbtCXkb5t22TVimineZkFw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm5844fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 01:47:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso2524011a12.1
        for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782092866; x=1782697666; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSPD0Heo3WshvC/QYVNxpXbdEjOPyT6zRjhPcE3WmVk=;
        b=ifIiZxOOpl1db4TYpo436tqmPBPlYZtv0H9PFNw/AkzLAStY/wlke/4htGMHmzRC2a
         U+w/Yk+lbwsV4wk3bNuKEIQeXIFWeueI3WnhgiHpxCpQs563d9xdH6qLPixSqlHmKcEl
         LGBmLWpmZcXV5hiACkqTkCfXBvW6nf63H0n3ih6SCXeuZRcwT0weFPit78dumZ7Tm0aR
         SyDgRufTGaFpwXl4BQsmqeSsI9ZI4o4ooedEF7mVElneLac/hm2KzFKmzAFzD1OaNXy9
         jErutEuXmDuZCEVYFcZlQ5FP/nGbjBe+l115/oCXyHlGf7/EC0wcGDhZulkRK1E7+qah
         0arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092866; x=1782697666;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSPD0Heo3WshvC/QYVNxpXbdEjOPyT6zRjhPcE3WmVk=;
        b=Ye/4J0iR+cvgQ02FKxu4KbbtM8YU1MT+sztGPEp+u2Qqu+MdZzn3UlL/5pCzy6yTt4
         lxEpztgDdssZvhl4AhRzXqmiGdPKudJcpTAzJBb68/FCIe50DyJgibqMT9IMf3UVUXb4
         4v4srugaYcEabibb+SPfb5Vwuig0iNBNRn1zrBbToE4c183yyM87MZV9Q+aI1SCZsvRC
         chNECXE0r3q7KruSVYAlvFyotBTKMb13Adpjfmbr/dEUBNqIwHPPLjPvd2p7clCkVoll
         +rHbzLIc5rK9Ujm3YPuohYMAHW3Z8b7VSdAkDt4eS4mKsFRfRJiGn9jSr86yzq1DjaNI
         jB/w==
X-Gm-Message-State: AOJu0YxqFMu7o7kbqhOdqk2Z1LSrlQcYcLIpDI6cqVmB8N+GW1buWlzy
	03iOXcVFogCWMAKrORNgfM7LnaDJvwhS7OH0/CdAGH8YM9Bs70a0kbc+8Zqe/nxNPs6RQb2EL8h
	aTATDcdF7DIiXskRfF7xs5C26zGukJEcvQBDBNYmqrhYAALcYHWk2SrGYDyFuwGrAAackjXc=
X-Gm-Gg: AfdE7cmIFi5qx3onafRlOUoLN1pwqUNr4xFkkjOAE3+f8Ue76/6ZXYh9/XtRcD8/UNA
	esjLkEG4f0QPw0qMCaW74Kdf/XVfwxsprGOn9mbhOG016rAqECSS4M2i885fPk2xhRS0k4oMQDX
	sH35meK9Ty1IG5C6X8yTZoqPAxiGihWw9DEMEVCLkanE6y7LHvYOPdVF4S/KBNe7qzLoSEEVbNL
	BxRk+SA6DN3Tb5WK5FFoYfrgZZah3J979um5VoQwYzd/U8W5zO49ZiYx/pNgoRa2lY0GdUmDCvk
	OkGIyUOhCBns2qHRvZZmHfIIJ1EKB5aig04xqGowQ/MNzZq4NyKU7d0redOlW8qy3WIiXtAi6Pf
	6Wt/ED3l5Nn6v2EeyzVAyJn7eTeTf1GXiPc260jpP
X-Received: by 2002:a05:6a21:329b:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3bb33953aacmr12820193637.26.1782092865640;
        Sun, 21 Jun 2026 18:47:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:329b:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3bb33953aacmr12820149637.26.1782092865113;
        Sun, 21 Jun 2026 18:47:45 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5d04858sm5402987a12.28.2026.06.21.18.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 18:47:44 -0700 (PDT)
Message-ID: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:17:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xkLn-oUx2O49dIFfSLON7TPzvW5RbW5w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDAxNSBTYWx0ZWRfX1cvPOHDStZN6
 51OHkMW2nmC/2QSlRcdQve3d+XpfRDrOyRT/MWpvEYuhGBqccrKxfTTymoWApzQRbkVKUUytUg7
 cLdJBotLU+zzFHJRbRinyyl5snmWxdM=
X-Proofpoint-GUID: xkLn-oUx2O49dIFfSLON7TPzvW5RbW5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDAxNSBTYWx0ZWRfXxZIhcSoLDp1G
 8mkhVhpAvcAnEk6akWoTgJEwNkaXNiOuaU7TpKiZLHnVRidgqCWWjwsu99/t+XDjzMTsFU5KMBi
 zhL29QktndmMTnJTIOFVHbpKGTR79NPRzJ2Al4uLDRo61XSol+2sNOXSv6Ht6TiXBb3PM+2Qr/k
 FM6UCyIgQdqlMfsuNLfxvNjM1IfG1BMSvDzrSvcHB8lG1+x7pqEgz3K+LH+4TTMcwgzaH9h8n0b
 AEznsmMsoTMzegraQm74iJA+hZV6ChwNCSqZbk1bh6tIBB6SOd6dEQvfzcvP1WWsgmMkSob7cvi
 URlnpYxaKcixZojIvC3wnn0pvAbgsiMxHe13vW36lYkET+oANrMxblTrbf50knPg5dxPz2GR/fQ
 E/QbpkvFq2ITuM0SgnWfeIZ04aUXf3lA8drJlzLcGBThWFJsgXM5mcrL6oG5+FEA3SFYy4RSK2O
 hkxp8XclUt83O+hJktA==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a389442 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220015

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
riscvfw-qli-shikra

for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:

   qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add LPAICP firmware for shikra platform

  WHENCE                     |   4 ++++
  qcom/shikra/lpaicp.mbn     | Bin 0 -> 1346527 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 0 -> 37808 bytes
  qcom/shikra/lpaicpr.jsn    |  14 ++++++++++++++
  4 files changed, 18 insertions(+)
  create mode 100644 qcom/shikra/lpaicp.mbn
  create mode 100644 qcom/shikra/lpaicp_dtb.mbn
  create mode 100644 qcom/shikra/lpaicpr.jsn
