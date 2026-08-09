Return-Path: <SRS0=HLtv=GC=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F730C5AD4E
	for <linux-firmware@archiver.kernel.org>; Sun,  9 Aug 2026 16:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2557F1F00A3A; Sun,  9 Aug 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786294606;
	b=Sj5herKzuh8I2tD3dP5l+5NUfXhIkmC450TMI6+iWHk4sD6IZY117N3oU/7ZUPGSndlk
	 +BaW9qLgiVqIkiZkO5J4f4e98zm9BVhyJJ6jPR+qz2z98taJsmj/inuAoEjUShkVqcCYn
	 mKnU2f7gHEhCGs8SI/BYzMjNp4KtPqK6uLudZ1DnIJOipAQsw5VGUVp74m40DC37llrRv
	 VSnAgntuf/cqWR4XrZ7qZL0T5qz/3I/phUyJgd8ruQoqqfAdttYPtlSXH7HkMkGldu5E/
	 1f+Bp12uMmgT49eCUbqawx1fi9o70coF3WgpewscPWI8pK1Hg9L3LLJjNGQnsa5Uclw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786294606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
	b=QC0lzddP0kQwufdHlj56qG03T3odRA1M1tyGFdtLVVA508AO6+69TtkQuS/08q2ejB4d
	 +rC9Qln8bEm1J4XoQiPlOG3w4bJvRF0LhNCRvIMjkiwqH+DAZftRpnHtcQTM5zoADwzpJ
	 SYnCJ9ICKbCTOFrhErYr5XUyMUuC4bxRsHPb8WSqCOs/oft7BZWECQ4Kl9yINEUfC7xhz
	 ZQzQONKgdqSfng0Ee9/HBBI7yLie5BgfveAjkUWoOhpHNtkuq2wc4te632CjnMTKabsrV
	 I/bSYhF9ML/3aGqI1UUxZdzRrkSyBtGb1xTOvUU3+0bQV0irAhWy0XVvQkRoVRyiEqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ias4j0lI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eR/ZDGPs";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1EA21F000E9
	for <linux-firmware@kernel.org>; Sun,  9 Aug 2026 16:56:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ias4j0lI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eR/ZDGPs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D1EA21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679FN8R0052913
	for <linux-firmware@kernel.org>; Sun, 9 Aug 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FRMtojNYebz5pnxWFacqhh
	jzm6+711Mk/YGMwYi3xFA=; b=Ias4j0lIMSFUAPycl6i+j0wnbv91lYzuClBcvu
	/LmWCPr61vcusvhpi7Hu3FotmTb2GvTwmxkxxyp5+Bd+aaLF4higEAz4TVT8PxTE
	CUlEp4AQH0g4TiTZ51GtlLD7G9Vwzu9PeTW4s062cZ8sWjVrDwQpWpceb+HL5d45
	quEDJztb5nJgShcZ+JHCeBc0JMBIO1BZKy4mZT2F/pheGpgLhawL/zh9JCmdiKW9
	meBmlsAYlXo7IraptnFrmjwOOAJM3dxbi3zhtNWtuwcZxRa/Izya65riLc6FDQ5R
	fr2KtTy/koRFlERN7nVIvtLvx5yR33KzJjAONqtowAHzSoPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gkf3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 09 Aug 2026 16:56:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so15214405ad.1
        for <linux-firmware@kernel.org>; Sun, 09 Aug 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786294597; x=1786899397; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=eR/ZDGPsN1pciD6clEx7xulA97E47M2qV9BC6UsT9Jre8UUtd/0jkulSsc4MMf1tUm
         K/H8/tFw/XbiJP5rtcgDGes72i8yVPK7OtiuhocronoabxIK9EAsc+jNdUOyOUNjShSe
         ZqRGYLgO0c09ajlMjBVcqT9EqyCtavUj5sePMNUIij0OCguRFdAtyIQjKW9/Lo2/avBg
         aYD19Avr35wavERaS5GZuJe+8P5nKUEI6q0YHwCPBGc64zmyrEe9foTvBhUrBBURu96/
         rw+uqaqjYhMglseC+Nu+lIisYQ7xrKB/T2IAKg5zarB5yKZ/NdCx9wErRlRoXe8rCwJk
         m+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786294597; x=1786899397;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=YKAFNvxSSAqixL0mPliJUSDwOPNPqjJJiv3J+67FZqF8wZuERDPVNtIqoVSPKKnqvj
         vvYUS2OVpz2DkUgzwNcEq0+x6JeE3eZwWm1tTDHjkkN5zzKN1eZeffLxJoVFTFq/FH1H
         OAZPsVWg5JoVaoYzau9LsUOYV78HOUCCQrhClLBqGKwxOqltEIyc5oOET2HYTvwyGjYu
         q25W+J6bIMJ8APmyeitQapazs1XufpCy3t5KcAtoZkUIGD1zyPCNRhveYPM5OHPIBdC2
         DUS07vPoaMy0zlnudx7dijX/YgmLZwx+B+p1b1+wh9FaydsQggQOqNT42h1zORJYWKb/
         U9Bg==
X-Gm-Message-State: AOJu0YzIy02gb6B162FeNkvDjaIw7jC+QsPmzduwNrfmEyfSVjeb7zM6
	cKcGnx14E7BKheW5MrRw83h4RRV0etAWXk8gJyNTZ+oQiO4bXgyMB8qF9uZt9Om2f2yCGoFDGIo
	v53oHYVdxkh39kmrXSY8yyK7BkyIIrcMOreLaVDhUVef4f7j0/NNLBLmL5sYnpS5iSBOyLeg=
X-Gm-Gg: AR+sD13DpHbzeyJBY/w7+XVpxzTP6ti9J4tki5lFamVdRI0eKVm2vwRpPNu/q7Ge0Kq
	FLYqZnLCQKa6HCgOi0sWzgeQ76VsJQFiHCPu6PdBzNgZLvu44er15/loeeA1wVuZerC35+2MUue
	FYVXk4eQJsEfMaeBnfj7296U2dwj+W6ajp9dfxBQlmrUT9W+hkzEvR1iyrU9g0nBkXLcJkmq7iz
	ACBvLQe1WXDVpdMWYLKKW8hJow3xGdsg5zL7w57XTjLe6QU8eorad52C5cXP2HthuLLsV9MEtLc
	QnNbZGYTnJ416PAvOslfItyUuIRIfD//fKJ9aYH6LYnXF+0SN3WZqyDY50VQegXSoe0QUNqyMXi
	cgByYJdq0yeBgFqk7Utmn+Br/S8UABrB6eTut
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822795ad.5.1786294597471;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822505ad.5.1786294597034;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm34239760eec.16.2026.08.09.09.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:56:36 -0700 (PDT)
Message-ID: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 09:56:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260809
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a78b146 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=5BXK2PN6kyUBF_VKF64A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX69Q4je7AHkDp
 ZUlEgsOShxst06jW/IH9+FBLq/MPAk7TXx+AzZ43869SPf7Z0amF3WCnZYKDV6MhFZs92ZuyYOD
 fgZrpH7CVJyljAl900sfWQoYlf5Dq4A=
X-Proofpoint-ORIG-GUID: 16i56SaaTQKxpZ50K4NAoqZI_au8sBtU
X-Proofpoint-GUID: 16i56SaaTQKxpZ50K4NAoqZI_au8sBtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX+y+ECrBJibiD
 AifJPO4iXqfgKVwRe4sqHkcpAJeBEHaa58B+AQl5xczzB/z/zU8fOawp8gCizeTK3M4dqAtnzom
 nhF5MZxTO76N2D7Cm7bbQc+/CLcHZnXVqKITtYQEWSL1mdHtPITanTrKXxDDfwVShXMVX1lC2Vn
 pan1I41WtHrAKJiAdZmtSx8pYFc8ZEPvMiLGzeof1TW8tCaGIgnbZAYNftAPuwnaPcCkKqIa7e9
 rFrqoCGYwAfOwcOAJuGyoL7D64mEJWJ9qfKahApDz5g2AsUzTTOVDQiP2G9pARdE4NlUM0UdNjm
 wtL2Fu+1Li19pr6eTFx+rVAncEY47sslt4FzpkaB+wuI4j4rvGQnN7LMKUCdqWwTsaTCyiH3N0f
 jplXPOP6DIplLB8kjYDGBohY2pnlExTLUY5w8jJK95gd0OTjeTyhA/B83feNadqce+oVdHJUy07
 Q+3AS5vNPmMKOqN39dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090152

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k, add board file for WCN3990 variant Shikra_EVK

Please let me know if there are any problems.

Thanks,
/jeff
---
The following changes since commit 16d815da3637f645bc67e4c71b757e70ae44d498:

  Merge branch 'airoha' into 'main' (2026-08-06 12:07:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260809

for you to fetch changes up to 796029ba95ac00dec03264eae3807e0ea0ae988c:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-08-09 08:00:34 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 867116 -> 893528 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
