Return-Path: <SRS0=jSlv=GZ=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBDFC61DFD
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 03:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0549D1F00A3D; Tue,  1 Sep 2026 03:07:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788232047;
	b=JfY9ZGu5sBt9R5HciuxeFyNQRCtpXwH7hPXSYFPyO0WFgzzIsQchaKVkfiXGMosJrc2w
	 3FitBFmJcXM5sJHfVvkmFwzcB4S2x0/lFhhSt/STd3RrlC9ruKYl1Bfczbjb75id2lSwC
	 hNo6Ezv+cFyBapyW/rKuUFa/USZcmtih7dWStPVW1YpDHKJ4HIpZKCxEpjIR2gN4tRn+O
	 pq0JnfwjuSuggHoU56a5aCvIbthQd1AREYStf0CXn0FGYsklIgIRapI5Wy1fW1SKs88T2
	 CcgHVoeqsFshQOI2ilNwByDmAI1Nl+HWeFuireZjcBdY04IUkiiQKwXg4iogqTzEDVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788232047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YZcoI3xKw+yOCWHyz+PvV9sooASkUltCG3xaLNpYt2o=;
	b=pwF8EdNI6qvhx8frGKLgeSKGviBASIXFmFCXez0+JyTKzM/f55GXzHCvA3Yfgi1hUhqQ
	 e8m50IrM2t6Y/belfX1eB606zqH0tnQolg555FQ5e5q15f4L/YlYF/ilesLyEGDF/7DyD
	 0kSA0cSxRGVcV8kCXKmNLQFw6yGM2zCX0gm25k+qzk5TQdohZNbKK19vVNuuZvvmRKgwz
	 spSiTND8ocGPBPOQZFh1l77grqbXg2YeOarHw37p33h1JwoCpQVO4JLAH8Dii3RYCyaBR
	 Wz6ErfEAyd7Baycsf5qCe86hQc0ZZyY6JdnfQr3KY9nF5h0pqkDsgrmbie4bWRrKG+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyrG+Knw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhNocBrK;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42FD71F000E9
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 03:07:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyrG+Knw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhNocBrK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 42FD71F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p1DG1487701
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 03:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZcoI3xKw+yOCWHyz+PvV9sooASkUltCG3xaLNpYt2o=; b=lyrG+KnwOv/YTU6O
	6d2iWWfMaae1zg7ud1dN/+aHTZQrXr8VseUPeIdCY/rCsDx3+kbqKydfDDKYfu8s
	3pOj7b/ml4AsyaGE8cdFSwpJkl+9MvYY3gi0Vf9DAw1nu/8MTC+3CVyi+28wgY7e
	3n558TRzpRyVUwu3X2viV2iJbMy6LmdhDJO9GzB6baAZO5ak22VuS6egcVuzNovS
	aaAPsIrUv+3YjJZN5NXiXrx56GG3U5aKw2vDYeokZngiZxpyQcJ+WiRizPZlOW8f
	HUb3bp9qJ8p9JsuXH+nDl0PhAicgetP0cZ375JLfdC8D/iHl4XqfYN+q5yX+Ky1K
	XZNdag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch9q8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 03:07:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7284855a91.1
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 20:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788232045; x=1788836845; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZcoI3xKw+yOCWHyz+PvV9sooASkUltCG3xaLNpYt2o=;
        b=NhNocBrKHl8fFXy2YYmg7JOP9uxIBuEo3ReBBNU4Va4O6VI0vhSPZWM35hzzyfr1BS
         qAYoVrqW9FX1hqdCvnKx5fUCKXbZwqyf4glBGS73QPGHzsEGVEWBobw0QjOQ1DInovgw
         cZygkVis3vbN27SOLZP31ODtXi1jvmF8an7cQde3pBzjTnnjqQAt0AteVpO5tAq7npqY
         4P6HjIbVM5ikt3/ubCES44/xB2n1AJcXJ1+D4SQhuu6dIaWq0ogEVwoYIIWViKccAM9c
         hk/A/zf7VZdcFIPuvplIKGA5IdlotQ1SGXoVRkwJtzPJnwLalvfWXu3JvFoa+hFnylMg
         psYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232045; x=1788836845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZcoI3xKw+yOCWHyz+PvV9sooASkUltCG3xaLNpYt2o=;
        b=qNaAOv1aHSH7VgTQG3aPk8GFVvUbSU4EY1QS3IjmAXClDdtVmnyx0v23EMVpyDnwuV
         1j5JcEF4hZxGMO3WMIwIj3uBV/xzDg1xC3BYdJYUJ9CIEchpPEKwupDCCAT2k5cTW4a6
         F1fvXsD79CDo07BXK/CKuQqybjkacpWXiPpaAG1ji3bVfetYjdZ0K5NbN6b6jHL8q2Y9
         Hr4f1AlXZCjRUo+xtFtu5gH1k3F1khCF28mS5hoILxC7pkq/YMC2Gqaq64FiBuDvAFey
         K5DQ4xUUit6O81k01yGJmfhqYTNYU9UbPfLDk/pkjU2LPSh/B/t+sqfHH8pYqyigdDL0
         eKSA==
X-Gm-Message-State: AFuF++kVh/7/x6IY9bk73BY1bIkuTLPIFmX7ImiW7xd5DyhwHM+uT1bF
	ZB+ZNKIPm0eLOHpgN/LmavDfZ6MDyV5F2AttaiPAsygPcbLwR/8v5ty63y+0Z78AjpZ73+nPQhm
	MAZr5h68fd7pPq5JtUp/HW9Ov3PvqYdp/tJ/LjaNgz/ao7kzwPJPTOiEzEKx5ApQ=
X-Gm-Gg: AYBFou3CDHV9NorCXh3K80MmpPI8tDU+xTlkYZbhAGIX7U7bqJ80a41+fKQwJcDjt+7
	fvotdLFG5Y8dMWf3aiTA5dyCue09m4zxZo3JTOC4no4DYScazxT6E/rStpptTrYDjfVrxFZAWFS
	Uu81mr4H3nsi40RrFk1VycIl7+QvAFf2WxRsvboTZ1cu3GZbmbNuE04n5p31aIE+7o1TRf7SKYt
	qXmeOwepVGD2b496KKNtHFkNJecsgIe5npMzG6Ey9DhSNh+K0nN9Y3gwSKFCv9JIqL29UjEfxQY
	ifya/EUZtss4NuqXg5UcsT5q4lutr5+FiXlKOMxTaiWEGYPW0kbS0xJ8iUwUHYgnaEI+mH/bQvn
	xRQoxdh5Mt9lp4WmvhlhOTEHIEcM=
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr21002945a91.25.1788232045080;
        Mon, 31 Aug 2026 20:07:25 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr21002868a91.25.1788232044606;
        Mon, 31 Aug 2026 20:07:24 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4f1bb8sm3332954a91.14.2026.08.31.20.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 20:07:24 -0700 (PDT)
Message-ID: <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:07:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3R4d7oyHWnNtxyN7GNXYjzka02rqWHDN
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96416e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=j0zUs6bRpvEvmVmpbVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3R4d7oyHWnNtxyN7GNXYjzka02rqWHDN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNSBTYWx0ZWRfX7vb9xOHUjbrg
 e58ApVNQ1HOTBIY6+cZoBr9poWkbcHqBiFHWpXUKQNUx2uC5TYXUPflBXCc2b8k72rA1Vo3FhXD
 uChSBLI0tXz+epXzOypcKH4oGQToLVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNSBTYWx0ZWRfX/F7krNludVyF
 FcNJZ4WGqO8U73iymuXwyQTi5XFT70/59viXrahAwtq9pkZiK444qLXWnGfo3BIMSRmc7zhyYUC
 fsGKnQyvWEyHkJH4dMC8Yq274uRurCgZcjAXoyFUZ4f7BPxCgE+/oZ5ZKGdS9kMdTCpzfKp3QTY
 rCOez/uBPpXlJYuLwBTtBPG+wznm0FCss3dk0yPqJ7ajMF7JIO33VG7LT2d9Fq+Q+HfOQFGgOlV
 b9hUQtfEIq7V4QIujQyEeJvD1YA27QlpKxZNYlwv92v5gPMKt9dB7qST6bwMqUmDlEi980mEsAD
 gFuosUqhBNOwxM8QiWS2Lm7jGuHqW3ypRtEUZDrRpzmysMNYBfvhABHXkGtjUOwXfqr8PPw1t+n
 pkW40GTdQNpNBWxWN8Xx2aNT0ge0F6xdPUJWvdrxfOR7yMwGebFDqesDdeDm3oB0z6f4LFogyBp
 4EZJzckzbStC0FW0/0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010025

Hi Dmitry

On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 31, 2026 at 05:38:44PM +0800, Shuai Zhang wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btfw. Please let me know if you have any problems.
>>
>> The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:
>>
>>    Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
>>
>> for you to fetch changes up to c13c658e2b8bb1fd0d4fb1181461a0b38fa1d4c5:
>>
>>    QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-08-31 17:31:54
>> +0800)
> Please test your PRs before submitting:
>
> E: qca/hpnv21g.30c not listed in WHENCE

Thanks for the reminder. I'veupdatedthePRaccordingly.


The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:

   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)

are available in the Git repository at:

   https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2

for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:

   QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03 
+0800)

----------------------------------------------------------------
Shuai Zhang (1):
       QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c

  WHENCE          |   2 +-
  qca/hpnv21g.30c | Bin 0 -> 6458 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
  create mode 100644 qca/hpnv21g.30c


Thanks,

Shuai

>
