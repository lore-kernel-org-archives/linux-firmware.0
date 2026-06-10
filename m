Return-Path: <SRS0=Hj3S=EG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0F7CD8CB9
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 09:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E0A71F00898; Wed, 10 Jun 2026 09:18:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781083139;
	b=1gkT4I2WCoO+3F2gkbrHixkrUJM+6yu1htNx6Ysfa/Zp6q20eX26dK19VoP7wG3DvL5u
	 Rr33SubB3kc5p9CFnbxth+jUOTxE8OljnLVEpSANhjWNgyh+wRcYIESDcUkTW67jARlyK
	 Bb3bYjoUdKhe1IEBV6oc67nZBCk5/MMn2JWiDN2qw5oAIW+/J9WoEFfCd6ja8QmUl8ahi
	 84yw6RDbHal+fjd8dUUHw+bhvmXC0Sw1siulH2iHdQMKJhGLUoy+MtnaPY37qSqnOwAcg
	 UqheZ+baDDAqZcmUOrH7mLwYpu7PcBuhVLy8bezrekLuYg/OF1wb8JAt/xBenbZMm4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781083139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NwslWFfnGIBG/bUGJ4YegxwiPy4WQVoavAI+pZXaTHY=;
	b=MhfRrHNplVwsXzGbo/BvFL3gLSj7EcIqvA7+CZcl6UxGkHFBr+VmqBfQKWByhn+o+gBJ
	 7vIWA5s1kzzmFfEh8Yp9g8e5DiXgfOftIQsKmVLdHLyl+Dq7RbwIieh6I87qf6Klhbntu
	 X1BLwkOVvBMndZwPrCxaY+Btpi23+UgCKmGxVWVP8mdSi3Ft2e+k/13YXo5oRRLC+KhlO
	 tCskzd3GjPWo+FD5i+GF3Wy8Kc8Vbhflo2VcvV+TSougT0KWRrJVkonM47uuhH8AR3uGP
	 xl46ymPu3zzERbrOAZ+sLRCniGo3rzW2o0XV5sC+1/TRGhEqsSgZL3xaCoE1UShzTIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzTYafFp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJSOk+AF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 905741F00893
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzTYafFp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJSOk+AF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 905741F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iFtt471147
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 09:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NwslWFfnGIBG/bUGJ4Yegx
	wiPy4WQVoavAI+pZXaTHY=; b=QzTYafFpg/gtwNNaD9geTnEhCIoGjW8SE8aO+9
	5FOEEOgts4u7HPr3ht2UbEpXNdVxglSU2jtoVw0sef7pLkbPpR2/9HQiV/zS34e8
	dCPopScYIk3cLDCOedxPGOxQrP8pcZ4l+hbbO8tRXSeVhw1X/berL6BIEKklRa0l
	q28gynd/aGMC0oOtYqx8IjleQUlAH2YuevL/be3IGVvFAkjSLcWcubBky4X0PZVC
	SnYI5h1rhYNMW6/nnNBUBPbFbaOijhugHX/cGrgk5z4PkohFwiOGQFCnXLX2tHm/
	JnnM5OJg+r2oxR60irFa1T0j+Tg1GB4o77zHunOa2IpRBxzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvheuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 09:18:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so6407163a91.3
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781083137; x=1781687937; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwslWFfnGIBG/bUGJ4YegxwiPy4WQVoavAI+pZXaTHY=;
        b=NJSOk+AF0RmUwHrBOxixw5iKMxB7SAxdOpOdcykVLAW6s4wKuQk0j6vaRVCIOZwOVd
         CMFPZZCOBvk2HsQJfO0KRG4idcrrne0Pvrl4xyDfdasAjUVzAvDO/3QbxiA89WrQygYf
         EguVhVvbgKWXuUa1V5Bc+WZCTGUimUUi4E+8jjS3UowOQiLULpKZdUzH1Xdvt6iVXaCR
         hfxT9UzZoA8gQxBfJGLQCknhPbQ7FtrBmbG31eazT9joRypu+ZVO1CStgQ+T97EdY1qg
         LxPhKa0D3Rwm1gOBRdeMqfwUaLlrtURHswVlPsSlih8wfAU603M2cWxo/uXFaQ2a1IFL
         takg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083137; x=1781687937;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwslWFfnGIBG/bUGJ4YegxwiPy4WQVoavAI+pZXaTHY=;
        b=pW0qSa9bbtzBC1CeQk3MmNjSCGc8QK8BmNVtWwSDOX2JhK7XvkbYy0aNoN3umXOYoF
         MpETJW0lRk1OvrLb964hk8A3JqOw6TnKdIiUgwEZ7SiqN/Nrxbt0g/Vdf4sJa/OcBG5A
         dYIgJUutmu+ck8W/CQOa3GF7SBQSGm3lwUk6ut+18A6/BydcQFKujuZUbGMXTgzzsx9F
         wOrtLHEay3c4NvQExi3PifHiQ+Aq3o23EcYQuSnNmZtqgJFeOHzXOToHvMAFaE1/cS0v
         Ey6NjzHvIFU5bUgPYE9UuuP8LgaW8s4xoo5+vSopJ437AUOsucnfSzggXZrJR0rF6AWp
         R2DA==
X-Gm-Message-State: AOJu0Yw+bCAT8gHH1TBgwqpPsSWI6FShVbOVjx127PxlIqafcBuqOJz8
	c985AiasmjIdHUU+joajLWyHnfuEbPYzyQpNa0ZnBncYpxlVFy8auKDGQgCwI10i3QaVFtrh9bR
	QKTHUdHWEB+TaQK0OEJmg3RyGd0adwb9CRjia26Jv28HZ2UaHGgs6X+bFQqIpFzXw2mj3ZuU=
X-Gm-Gg: Acq92OFIuN7s6/8R2Y7Dl8/nH8cTmQUCKITyESBsQSIEvV5beWHtuR/f1dVsGy0dKSR
	r1g/zIGiLDvosMRxHyyIqfFqa3q6zbneN0tVN87WmuNk9Z1EcLPMY6C1HlF35Ik/VgB3OOScRJ0
	JaiEzI3kvkNYDOFkRatJYlW81kKklUsvNKP34W1xlGhZ35bFjtLVVHQ/wyLEMQ6fbTCO3A061ZN
	5NH5cMZRW4ZjZjew43wRD9KCCZHTWUYxKYijpEua6sKSfrsMnDQ5LCTn+z+4rIHKYN1prF2J0mi
	E/edzubPRxY6JSvBZ/p42olNI0peah43vKvy14ZjBHRzZkCSNcu6b3pc/ye7gkny4uSk/X0bGYD
	ubetQloMaj82jxBjOQUpHMxNC5Nqtq9TvmpJRAZYB4JdFmIHh4I6jM9M/lcbeYA==
X-Received: by 2002:a17:90b:4a46:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-370eeff19bamr23406133a91.12.1781083137200;
        Wed, 10 Jun 2026 02:18:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-370eeff19bamr23406112a91.12.1781083136715;
        Wed, 10 Jun 2026 02:18:56 -0700 (PDT)
Received: from [10.216.44.111] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm21981940a91.2.2026.06.10.02.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:18:56 -0700 (PDT)
Message-ID: <cd48d687-d403-4b40-b23c-8eb3d4f5708e@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:48:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G_5SX57REuy8v1moYlf3E-sRC8bvGGVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4OCBTYWx0ZWRfX02OuXpGifzrB
 9SCouIE/RNfV3zJk7TiZsvqwvMeZ3VVM7KFWnMqvbdgvufTSgn1U4xGrPgDBYRMUpxLvs0mpFYJ
 H4iMZe9QArwYEEStL202kB81TX4PX48bdj6Rho9Ar5ModX2XOVavuSfmjna0POBQu6uTM3MkrKK
 34Vx4Yvi40rUXawC1oRMJdv1VJxPW9gyIJX9KwI5PLECNg8CaWdJalyMpKh/eGQ8HIMWZB4RcsT
 fu6b5kBO8vMRbbQpKsxdK/mEXaW4bYGvgATD1N7G65UB9rtqpak6g1zTYNKPF92dztXjVeFlpWn
 wEwBXh2f2ID0A0aavwgs7NxjFovcdFUx+5bDoIm5cnbhAiEaYY0l3Pc082WhLk/U/bRqEmWIukg
 kY2G9BgMdvti8Yvxur4UfWRqFQBHaczksLFqCFQgo96piWhQEH6+aZOuv8hnC6Z4/jd/yzHG6vE
 fL72sgbZql32kAZ7vRA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a292c01 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=9KNJVCxPm47J-4wTYIYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: G_5SX57REuy8v1moYlf3E-sRC8bvGGVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100088

The following changes since commit b672962ed4ea6f9de52bc7bf9e04e96585eb512d:

   Merge branch 'superm1/unknown-license' into 'main' (2026-06-09 
19:38:15 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to 2cc69912d8d7eecaf0be8e19baeedf3fd163b94e:

   qcom: Update ADSP firmware for Glymur platform (2026-06-10 14:46:03 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 17049560 -> 17053656 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
