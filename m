Return-Path: <SRS0=EiSH=HU=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA28CA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C872B1F00893; Mon, 28 Sep 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790599349;
	b=kWaTjNSvmCTikX2Pt/PPl7ZRadQ0I0GtOvQCGSchAeCmmo5yVG6wtYZWt6fIM7giSw9H
	 TH8weddCXbFjyH7nybFWFmG/NwXshBcAoROQ8qY+0MEXtZ9Lolqnf+7TtWQWDZch8RT23
	 ZY0eHzKWZpL1FgP7118GD5Hd083I7Izz2ZHe56/Xdk6totMg6fWp7pxYtRc1b8+G6skIz
	 f9Ou3YG5YZyUMB+Cq0Si17zT7f6yWxEZ8j/zl3Dw1GLOaRjQ8eijbg/ZGJ1iRGWjb1FKd
	 WRwRJGErzJzrc5AnD/94aBYZsbaeDIZ8kK9UCYvLxHrg11WFCMl2daagVVJbQ0UQWdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790599349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xicrYvdaxI/zhIyZvOVW/9usDlFKxkqt6Q4adMGrNP0=;
	b=Im7my6UVqeGyIb//pBLRul2EQvsXaQ5O9bQ4gBqS9fqkpK1A307URMNxq6ggHJYLNs16
	 Sanl5N0OYLdDr2HYOuFmT0fmg/OrwSK//7N/EbfpSTpDORx9YkmbTfvmVyhVUX63ef2Rj
	 a5gX/dqYlT+nsXS9uWz7YEdTdfJNJzTkRi6GRcIXFKfPB+XpjkFwuLMBt1nj2It2ibo3q
	 H4MktYz7N1O0NIzC3+1VeNJs/wxBLQ/33FROVHsD0T4QLRnM9QSv0RLyr85Jzz+RiY9Pr
	 QhMLveELiWwm2+g03p897Gt8gTQQFDXy6TLlMEWfydZR8YMKCnmvsIQpnw9QBK265Qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEywEmHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XIye70Si;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D0581F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pEywEmHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XIye70Si
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1D0581F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAJOj1839640
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xicrYvdaxI/zhIyZvOVW/9
	usDlFKxkqt6Q4adMGrNP0=; b=pEywEmHsbnyy1wuLjsp2Kw6YDWcFUYLelkrbC/
	BEpAXN105IohIEdFs/jSQ+zOkpI65aeCwahRm8P+ugpLeazF54bBxNtY9gzH1WoA
	Qmpw2Eo+i+p/kV6HNU/QOKP9sDFe6QngkSuiDuJK5zmOAXroas6r41L+214WgUki
	G7zd15Sq+huzisAf9Qt3xEkf53/O6yL883HIByYaJXz6H8d53Eu067rzU6pvasgX
	lOGH5ZCyMvVmfZi0cKNUgaJHtk2mOC3gYDJxW5d01AmvFMNv3ZODWvhJ5FbjpOXv
	FUciMH2cCvwp7p/CFO4/6bkbVvKBsErLR6buWXzctEINHFSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6gqvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:42:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8699b293a80so1687357b3a.0
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790599347; x=1791204147; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xicrYvdaxI/zhIyZvOVW/9usDlFKxkqt6Q4adMGrNP0=;
        b=XIye70Si+Ra15eRWHhB6BN+hGvSe7IJ+LCmkoaU75x6PownhfqolC5JKNByBdow3Ow
         OBPo5xEA3ebwsucCsaKLpAELshIQb4qpx3952L5Q8x4Ol6oMGCvEurss2xTxe5VOU1q1
         6QEZtux7zH2ehHnvs5eK/6P282AtqDNuhGwwCsCY/Gi9fBMCLo6aFXZwjgfrSGQQQc7n
         u+lRYGvvh4dEJNz7sbCUhM+Yi03wJYBWxxcEgUkmhOzta8dyyaHjikE2dPjZM6W609SF
         r5hZhFiFNT6ifEyXd8YM1sv75YgPasAZVjaNDtWzT/nZZPSIdKwue6d8khsv+OEVzjV9
         1ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599347; x=1791204147;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xicrYvdaxI/zhIyZvOVW/9usDlFKxkqt6Q4adMGrNP0=;
        b=yNdC1B8MtO5c2G2DKqhQoKE33R+1tRNG6k90tcAlRC94NuuRlujUDG+Z1gMd356X4g
         MU0z4WxxJTGf5JaUCkCW8ufCs2fiDjtri/0vA9Vo2xet88uF3RUgqfsyK4Jh5wk+FASL
         8kTrEk0xMD4FPgeburiYxmumbb3AEUrwXmXdeCHkWHQoRZzVQurthP2hbXBFlVZn4irf
         ZxXAxb8PBNLasLoi5vfoSW0OHv2IuLWJEqW7s3RJDhnpQHOwb5Zw2bRD5HPl9shBf/Oh
         H+ya/i8M/3Roy0RZxvjfkcgnCvR4nRvx3KL2Ddhcci+PiMQR6GnbeKACU1mXyN8ojeTB
         jPwQ==
X-Gm-Message-State: AFuF++my35V0UEVJno3Mqoo4xOvKtGEDHcz6meHvpXDsbNC7q+oDhRij
	pq0uDGKL6+LlKKa+XvyFDuq8yCkzIpYXsijyAfKscb2q+FLFqbIMbAzsou86al5ifKNFytIoA4H
	yhnqQsmia3Bk+iEwpF10eyHAzLYS/wF6yt8v2UUp9ai6Hf9n6XdzCQi2CHXsJZHslqvFbNUM=
X-Gm-Gg: AYBFou0shXBgVPeFiJ7ov/6qbfJktn12HKCGlSZv7da56UjH1/1zUz/OKk03sn93o+M
	SeYIsH3RXT9ss+DuujbFJTHAEntA3W/rX4zH+h2UXNSYTBCZ6oiHphwfNtVabJPFZzm9v9cBGkE
	Jy+cRHedSIA84bERuDVUBYzPH2MUbdbKhckLTebl2+siReHx9fNak2bSGk8Ystw2c7QpzVyGTB7
	YpwGIg7d53Z9ZJTHAIEyzkOjU8JVq4/1Y9yt120fXNYxjJI/aCRdBWCDKFEmWqN7vGYFPJ50K9z
	gdgO5o+MTI7gthuzt8lA1TPycHkKGw3P4xjizbLtIgMLKrsYyEvgAt4jAbnUXCnn4OxiJVk+wCy
	tBnMy8X8SjRQrN2CneUgGvTAHmSg=
X-Received: by 2002:a05:6a20:7f83:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3de0e6ea1d5mr11701236637.32.1790599346846;
        Mon, 28 Sep 2026 05:42:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f83:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3de0e6ea1d5mr11701207637.32.1790599346235;
        Mon, 28 Sep 2026 05:42:26 -0700 (PDT)
Received: from [10.216.24.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882ad656fdcsm1750084b3a.18.2026.09.28.05.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:42:25 -0700 (PDT)
Message-ID: <b4a67b24-3a4c-4b04-91fc-66865abc0316@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:12:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Revert "qcom: update ADSP firmware for qcs615 platform"
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MCBTYWx0ZWRfX4ZDtblgz8o43
 XAkepbf/AC04CAndWwrY1rXV5ktg+jKNoj8ISVGJLZlTGJpl4Nv99Mbg+PKRFRrp67dR6yssdm/
 ANNP9MjilgTJXr1cnhV5IjYB5lhoO1wxX869AWO34gq0n2epYAqDzyfCFN8tEw35MQfEs+pE0V9
 CNUu+1CuVknK6xRczsZN3kyZKlDuaxmPS82+Fogcd7D4kah5S1ASIMjEkLZVcLQ9SQ4h39c1y03
 +q7vP/7HbXmC/mtjfhgwQkM9V3n3Md0l5WOH1CLLw22Wpjb8ExZcIimq54on++RaH68N5ZhTxUO
 UJIGTYe4HIbkRacRSQOnqKzyqpFIDMbCt32AJ/TKIo3lO7I3OvT25160GqK1VgYFs/FmZV0Ix2e
 qjgfwvN+OtAnv6LZUxYD2kct36Lw4wgYQrdRfCyl4S+H2e5ar5CnlfcOw5w6rivojeNCwW8MIcy
 DUoziszbV2beP3zTV5A==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba60b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=XwlOL1DTWCUjJ3RtgzEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MCBTYWx0ZWRfX0P1WhcdH+tkr
 /psrR4Cleg7DXYotCTZd2b08Q7s+0HSyXwdLY33si8o1PK6oodpP+YTVg04LG5ClM42Clgsck/X
 nEvlWSKC1orv4DWKg9E9mTn89uTHpc0=
X-Proofpoint-ORIG-GUID: oBQUe1VghCJ3W8s69TVvOo04qjiqrShC
X-Proofpoint-GUID: oBQUe1VghCJ3W8s69TVvOo04qjiqrShC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280050

The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:

   Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-talos1

for you to fetch changes up to ab0861c5d22732c7b2093f97f909dc82591ddf23:

   Revert "qcom: update ADSP firmware for qcs615 platform"q (2026-09-28 
18:06:46 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Revert "qcom: update ADSP firmware for qcs615 platform"q

  WHENCE               |   2 +-
  qcom/qcs615/adsp.mbn | Bin 8659084 -> 8532108 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
