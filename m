Return-Path: <SRS0=0WVS=G7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BCBC79F89
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 10:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B9531F00A3D; Mon,  7 Sep 2026 10:48:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788778104;
	b=BMO6ypNXiHGp+g4pt9taXOyM+EiTOlduJS8Xa0AGFmcs7/XxLOVk4VNY4+SkAqtCyanx
	 2BAeLis8yMgdysQoLLRsY6foAanbK7EAvv2wq0iQKSvaegap8dAtT+KzJpBh8OcGbLe5D
	 mGJRHzOaeCBWq2GH9dIKmhOfFVuFbtNUTq6HjEhP7weZuEj0MjMN1veT6jxAL1aCw3qyk
	 302qqYBc3DStgzQbYtgT86fRMuGFUouvkRxEQA7IRTx53kBq5Ho8trqqE8GpAsujRz/Za
	 8LTEn2CQH17sAwX2HQqdisZuWnQ3DxLXz11XkCCcGiBoCjRWSCGZ170Q+Dhs6rVG+JQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788778104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IyWThMBSCMx2CL552HZR6vAEGYT1tPeVHFOIhe7kmW4=;
	b=ETFF7U9mKhVJYr3ZjaMp47toA8km+csiZOTiUd3wXlIzFa5krQhW9Y2PFtmNU8bmrhNY
	 MIzbK6M2CnCn7nCtZfZisCwKcbJC+p4l3SrQycVbvFCkPiT5IEkP8mAnyw1wNK0KfkKB8
	 vWnQ5gKAvv8WXTJ3vdhAQVk7nprXH83mqAMy6DfP31QebIowuZFSd5nZuF+JrHyOCH9cT
	 fUNgiPm0w/+QeFLwVSMhp7CgI+UInpip7B/9/p64BXR4X9GTqBvJbZBmIj9RRcF17s3d7
	 g6HRdmurIBO8tZGI9DjmCp6ys3SBi097MZFkC+LybYRVWbdvT4rJxid82P1R7N5uuwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8AqZVQe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kEAV8F71;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 696FB1F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8AqZVQe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kEAV8F71
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 696FB1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bgJ04037684
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 10:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IyWThMBSCMx2CL552HZR6v
	AEGYT1tPeVHFOIhe7kmW4=; b=C8AqZVQeHIeSHTPOjed+TX3KfTay7mOcBUVGQx
	1zQez5NgPIKgF0bh0vZArftUTngtsMS2sw0QlqOJX5us+Rm6kpxMTjeSYTAvj3o2
	Z3rJMORNjT8pxEmdEoWDzl3NFDxGp0wnQ5frrQ2Ufpty3L0O5KnV4q+d32DnWXyi
	9i0P5tyhIzgKimfIkbD5yBOKU6IBffkYGRPa8QK8Hx4lc57+Hzj0RT8YD78XqFnF
	b2UihMDwI/449EALa4pU39/t55KNTuwxhaVJSdHYCJhSeRj06jXxqCokUVnXrtiF
	Jceo5iwVzSMnderGUIO06hyRDZ09a84KR2BPtHnsw7fPct4Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0mj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 10:48:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a45b3f0bdfso4705096b6e.1
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778102; x=1789382902; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IyWThMBSCMx2CL552HZR6vAEGYT1tPeVHFOIhe7kmW4=;
        b=kEAV8F71gGDZKqAA/lApsOmkqD3oXB8vqRTHLlq7idfT9wuYTEpi/jcBv9C30+Mf2z
         mqKabJbsd2ha6ikvYgUamN5vXK0ec2emik1+oD4B1vDhFrR6//0sLm9a/3FrgijqxDwb
         khmGtM7Q4inwz5xGg9N/LqJUUs85p5K4cQXcLuewrBS9bMtTwvFAVZAuN/VrkRNyIxhI
         2OcMjH5wh0IeS41vF27F1J7b3o+ssNpr9rqr2wjqDqTv6pnH37/Aty3uC15BbFHRHh9p
         FVu1Hg+xn19OafS4OZaxf23bCHh7kcNgsrFoQayytYuzuHvz0qzom+mLEf6DgE+24tgl
         hPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778102; x=1789382902;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyWThMBSCMx2CL552HZR6vAEGYT1tPeVHFOIhe7kmW4=;
        b=kpAx19ex0dlvWIhDV8I2GLqCgDpovAm1uCLpluWaEthioFf5SEqm0fksXsYb7dbpZa
         v8s9gEgV0qQiVWnDQANzsgfLByQQ18TNZO+pPmusI3vMcIYSeXPn5zmD+tNnao5MfMYm
         6LqfEf/0Fm0lkkqRFPpY3C92Uqqs78lBw1zDgLxbBlNTh+MkefPFjEmiKsofHfk18YZM
         fEQxEVZ31heSHo+v+bsSArU4qRWmpg8La53mnD85DSxi2UFQkrK6rIFPgA6EqkUDcQ6m
         ggRTq4cci+KCwRxd3WVdkmUqyphC66b6Q7mNgOMIOCVqXVDPzZlQkJZnXObKnmXqobXN
         qSDg==
X-Forwarded-Encrypted: i=1; AKwUvByxPWjvWcMGMxeyEIF8zIYgJhAeXLSuBpiBZZyk3EMooVCDuF5E6CE6OP6rw1UoANTNTN7bmK+aioeh5tXKLg==@kernel.org
X-Gm-Message-State: AFuF++kIwF/yWRLj0CAmfPyF6UN6jCPnkHtS5ox5MBTVwnr3zDvha2/z
	Jpx6TyXR2n+8Rf2iIXdOhQkosSM4vpXNo38XJ3eghztH8QbBJCnMcaEQRQJkvK8rODrXK0dF2l5
	gcckrLr0T9798x7W7eDebegsejlB+1qyEaR8a8+AzW5GGos8/wWI7R5GiBaBOw4o=
X-Gm-Gg: AYBFou36HZBopLM5/n3kfbalderM7rXPWsUwi02io3Q0sFzXfQAAaCzml5HiRgnx6VK
	VjNrBZlKmwV8ArHjWc0EyLzQrZ5BJNnj0FnjbECpOT9p2r9Ya3LTrGlDLI3aDmkeuBLQkHcQ2d0
	e/JW/adz+9mlBaWszPaNz2YTnUzockIr3Er1DcxMv17DUlVJyNVip/S9Ap2MjzLQIKHoNRg2+Du
	2zrFRTRrvElIslR/VqLJeuWHOJemfUnAhCKSaqy1aHNWgYPJieOD3bbn/I7mDeJn0888r+cQdsr
	JBfieumiwGgtxbJGhMKMpCQOGjE6+sDppbui2jIcIK4JrBSH7tsmwrNN12Lr4V/6Znp/dAe4tQR
	d2W0ora6+Xkp1/l17xpCIyPPjrsmB
X-Received: by 2002:a05:6808:130a:b0:4bc:d58d:6cff with SMTP id 5614622812f47-4bcd58d8b6dmr3345699b6e.43.1788778101728;
        Mon, 07 Sep 2026 03:48:21 -0700 (PDT)
X-Received: by 2002:a05:6808:130a:b0:4bc:d58d:6cff with SMTP id 5614622812f47-4bcd58d8b6dmr3345678b6e.43.1788778101264;
        Mon, 07 Sep 2026 03:48:21 -0700 (PDT)
Received: from [10.219.56.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm24704015c88.1.2026.09.07.03.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:48:20 -0700 (PDT)
Message-ID: <a17c7a59-0711-44d1-997e-8973c4849590@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:18:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for qcs8300 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX8N2Zrc05/0a9
 jhxPTLoJzi/h1czyGcBsr6LXET9zzJDgXbXLuztXDSpOnH5soG2WknLz/77Vnp4Q+xl1ZHwtNwy
 Yh+ChEL8btsmW6+hECRatl8vGD7v6JNP/2l7PnreHVRyVKHq5QiAC4joE8wlGxc/shkLm6qPWg5
 d5KMe4x95qUHVCwIgjaXP+h43CKlXr5FFlKmR89Mv9QhbetPs6DaKh9OqBjkJ/VTR2oGlENtUkx
 ARnaEjZRPhivwDPF2po1gdxmRbPyyb+dL52VEeAZSviIUbuBcrZ9ymHiKSH4AnaK6qb9FeRHLP2
 35Uq5kzPeeMgEqaOvnB8axNmbO+kxX4zIoivSt4qK8Bq+gm3XmiEnQOk+PGvYbFKuiWzu5yGU7L
 DrkrfwlOtQWGex8EuKzX4BjbL+HqpevlRI6GSpgc/SYLOvj0kZHyNCBAWQ4SSwrydMVx87eNoOR
 Q75Yq46c1UVrx8scxow==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e9676 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 80U69ja-YS9zZ7e0pF66bfis-zr8WU-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX+M9bAQZAM5De
 CP+z68Yc+meWIYmSUGL1wtuDr2n6Af9U3fmzC3WvZSxRR5qfx2+q2bNIeJVJLwCnez7rFh8uylx
 BXeoRCwFUeViX8JQ1aEtspK4Wjd7UP8=
X-Proofpoint-GUID: 80U69ja-YS9zZ7e0pF66bfis-zr8WU-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-monaco205

for you to fetch changes up to 21c07e735653365e87e09b5cf2c288fc8bd48a5e:

   qcom: Update ADSP firmware for qcs8300 platform (2026-09-07 16:14:15 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Update ADSP firmware for qcs8300 platform

  WHENCE                |   2 +-
  qcom/qcs8300/adsp.mbn | Bin 6803456 -> 6844416 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
