Return-Path: <SRS0=gj+A=H5=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE47CA6002
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 08:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69D511F0089C; Wed,  7 Oct 2026 08:55:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791363327;
	b=vVzZZubb97goFnZfMmdfyWDD/DEgOBeYTsc4d6bHni3+yasGZYhRq8AJaK/gK5Sl6JHF
	 FS37k+/ZuQKB4TMzqy8DDHjp+VLNGSiZeLTG88pd5fDQWPoJkpzahnbNQmAtK/KnQmyof
	 5lRPYqFRZ7rSSGNQj9g42HyIwxTdHNKjigAWiTEFEjmJ1VuaV8hR2dCVmuLcJcXpU0UI9
	 7NQVsVOxHHony9NDf+1ZPT0lIjNgDyrCkZU6bwcWfpa1M2oePrV8gWvahGOi8Xr6YILqA
	 Fsj9hXbrXCQoHQLwq0POLUdbaCLHfU0pmaqvhp4AV4kHVMa8eMFKKY9PBmNTCWX3uIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791363327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vi8h4cy3jW3xw9MlnO6QnnPZ+VD5brdhjtDPbRwq1vg=;
	b=jiTfoFwERQUyezCQKQRkztFF+N4RYHa2HCKpF9HGlp9Amr/6gMUfp7yQBc1RC7qkC1DZ
	 dlh2HDElG/SEMKP/OclJeCaaR6DW4vFPCHMKKkiIPf+Y5tuEX/fZmaUZGML07wzNah74s
	 BVaaQ6pzDe45m0f//6FnlQOTXBBOkTyEsNJkw38psDHYOlFdkLX9EO7UW7TVQw2x4hhsy
	 7wH+oVA7UqYSoH9MU2DQCc21t4GUwbVuLdoAdO8yfx77mGbynMI7O+EvWS/w82ziiC5Sm
	 u8guEtyUZsOwUhzt8qOMRk51kx3ZeEsrh/DupAJTzSJlk//BP9USvgCHvlBgASZabcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aers5U9F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwqPQswc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43C461F0089F
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 08:55:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aers5U9F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwqPQswc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 43C461F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjD92970140
	for <linux-firmware@kernel.org>; Wed, 7 Oct 2026 08:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vi8h4cy3jW3xw9MlnO6Qnn
	PZ+VD5brdhjtDPbRwq1vg=; b=aers5U9F7xV4F9v42vVUeKtkjFqP7PUJei2uQT
	ztNITCQzg3rWXZLk+yHY7tRLYJMcqHXLxAxMJ5/0ulCZAaoqH5+igarBhJtPrsFv
	24lKDfyBGaOyNOSm0h2hPFC1qEpoTvMq18EWnBlYo8CeFh1qrfCZUUErf9gF35Yo
	yynJ0L7aplsjda8bNIoifAu+n6ahV9RPkHMPP27oj98eYUK7cITmFTl2zSlEVj3p
	Mops7y90Jia4+D+FpKin7FWk++frvp1TMw1YXiZSzEIclYSNekUZjzo39zr2qYnX
	BVWXgeLMtS00KkRp94TUvE8caFKrlcFJR/JuIm+qIR0yaZ9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679b2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 08:55:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7255548a91.1
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791363324; x=1791968124; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vi8h4cy3jW3xw9MlnO6QnnPZ+VD5brdhjtDPbRwq1vg=;
        b=WwqPQswcuC6ZvZE4sRkg6t/RD3lmv4vi2UKTfb4ZVy6ccq92PYxn6ZnVRizAKuMqs9
         t47TZKPkSNQgPqRdn5S7LtEIbPwOVRGUpFbRyCiSPNx2q+/fhXQovaVL2nyBXrDVtUu2
         Uh2H7iHMGsA1/yVwT4Oawj6KZ+2OUM6kPd/r9oLrZ3EEG6ML5n9aZqGaW76JwYZ7TQb+
         lbudmyN6V4w0JWZsGUYxCf6JBR7mO5m9kI7yHepLmJqYBAWSdFMUxKvQchScB5PmcAJt
         hlh7tZlpRzKFqiuRcnORLWHDCwK0PdVhiSmLdCI10ww5wSBLVA/B5e0E4IsUDb6CgX3q
         Uo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363324; x=1791968124;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi8h4cy3jW3xw9MlnO6QnnPZ+VD5brdhjtDPbRwq1vg=;
        b=r6xTIzh93hacllCPIF3uU1bf4rxHZs09ZHr/ISfGiyHEyHug6g8iyXONbRrjQxt1AV
         Tl5vO0TtCJNwJZUHxijwan2rq0lgKheOP7hNynahZ9FL668BG6MOcOucPn5iflqm+axq
         MdzRwC+RjChPoDgDkxNAv8eokVozfckDi9L6v84uQ4rJq6zO7T+/VrUEJawEtHM3dKOE
         Rzo8YaVO7iS+sqOrKD0kwzE7B0oHlbv1Fj9tbAuAB8rZnoxJmor6sUmOHcVPrY0c1wDo
         VhkprQM7BbVBXZx1bDOwA4dSPrsUF16C2V/FwDi4qrCKjwmDK9dXWsFuc2SzpXqZz3xL
         vQcg==
X-Forwarded-Encrypted: i=1; AKwUvBxQs3+l/wb+GN4uYKXnEwVn8H9e2ggiyd8cNBb+xmyTKU0A0MhLdt2vgYyfDwnPfYBkT9BB/5ZastNNoBW1eA==@kernel.org
X-Gm-Message-State: AFq9FYL+2rXDQkRdy3CpNBcqtGJwyrBf4EMqVOu5tPMGnmpjviW8CWO5
	g6G+mTsn3J+cdFv/udHSAYeGc0kUKq71LxJKETDYTlohDJjaLS/DRRDiHI5VPEH5mUUaUUxjtIW
	Vy3w+54c4wD3aTXsN3Gxjnr1G9RC2L9sAzf5tutZa4AAfQciVyjxMHxm5fAGGxnt0tiI6fYI=
X-Gm-Gg: AYBFou1t+uW+5SKopO9BkApAwqET3Lj/lF1p8Alv9vYvik/aJA7lJ96xQI1hOyZgjWJ
	EljXDnC+yZoO8nfOg3PojXBq5XfRwPKrLZ1JMPz6fA06UiBmFHoLJ5fTVZgF5u5ItZXg5qXbNZw
	SrPjh8KderUSbNtYzrz5WqT8XxvzkU7FiaqSRgPEf2RBHY9hELOSlI4Gr1sn0D5peipEYQSuf/z
	IoiTtj3zw+hF6sXWxn2KPvycGuqKKdH6Cb1voVy2vyLiBoYuKXiHqt2564MhRpHcF1U6XRMthYO
	g3gB8pdPa4bBgW0kCtP8rJeoNHjvcz0bFCwRmh3fhYMO/WpSpRRAHeXtOjYpks1KJMFg5+7vqxN
	8JpMi9F2X90ZJWTh63qsGbzGZCUnP
X-Received: by 2002:a17:90b:518e:b0:3a8:32f2:f4d1 with SMTP id 98e67ed59e1d1-3a8a1ae05a6mr1333903a91.39.1791363324100;
        Wed, 07 Oct 2026 01:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:3a8:32f2:f4d1 with SMTP id 98e67ed59e1d1-3a8a1ae05a6mr1333888a91.39.1791363323622;
        Wed, 07 Oct 2026 01:55:23 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d416348sm1583676a91.0.2026.10.07.01.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:55:23 -0700 (PDT)
Message-ID: <45e46e48-46c0-4a9b-b0eb-e1c5ca4f4545@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:25:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2j4Fl+r0Qfdh
 dCSQwnvNkI58hEuWe657awl7YWyfERdVkfQJt5OjLwEcEkjVkLjnDx/9diSkHjpjteEoXfcRST5
 +jK/T/s8KtZhsgKWS8EmbG8yrG233yc=
X-Proofpoint-ORIG-GUID: KACuiDLK2DITGV_ue3A3Zbwd-snEkHIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzUCTW2YkevOZ
 zvWmXHk9dEeKWRIpYTPdUD6mz6j56fytfw4pEPuKnAoyR8zvFZ/15O74/ncA08kKb/Fslrk5L2y
 gRyGuDd1C0iSPPNuZ4g5VGnQ0TRzI0fE7cKxcgL5r38YbAA45fJZrxvseBm6K5vMjwWU/C3Pe5+
 FsHhg9FIS6+lIvtnenBoNkWgxNBcEOyY8VKf6se5WDxF0HUJgJWzpCIE+yf2IudzYTWQPKuo42v
 KH6UayCw6gBH9LcfPOY4l8EMLbOc/qcL+M7EeCZTWkLRdSWhGq03/hbbg0sT7BWAavKnCOWylJK
 +QD/vMikaHxTWAbx9hsK1JHF+Y/tCglzMgI0tVPFyXVSYvX1Slfh5iXZlPBFtevbK9OBUzuIE2m
 3ZM5UC2Pc2Ac6C79ZdzmXdgS6aesCZ5r2zKl4ZKuE7wzvpRazFjiBM48JC2bgwQre1gsA85BZES
 ANWgOXwhAvCHPNJ3BVg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac608fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=ceBp4MrVJ_2695Jh18QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: KACuiDLK2DITGV_ue3A3Zbwd-snEkHIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

The following changes since commit 79104f902411a949afe1da25dc25e05e3160fab0:

   Merge branch 'robot/pr-0-1791302343' into 'main' (2026-10-06 16:25:17 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-nordadsp03_6

for you to fetch changes up to 6c8cf886ceac8745e9c34770e613700e887ad1e8:

   qcom: update HPASS firmware for nord platform (2026-10-07 14:23:39 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update HPASS firmware for nord platform

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)
