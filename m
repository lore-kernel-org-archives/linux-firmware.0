Return-Path: <SRS0=Hj57=DP=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4113ECD4F3C
	for <linux-firmware@archiver.kernel.org>; Mon, 18 May 2026 15:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01D90C2BCB8; Mon, 18 May 2026 15:38:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 383D8C2BCB7
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 383D8C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDRTHo2891748
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VCCZ5HUUrpDihIT3hton1G
	SM4BZ3XI4quqsj4TgrZOA=; b=Q7tXQMmtAKZpEX6TmzQJb1k9PV1uKhcFbp/LWt
	dyqVoko9BydIu3F+FEEcxzmsMgJqODwPpKYtz5TInMjGex0lPXBz72xp37A7nbm4
	UUBdhlU7QG5zAGSb8mx1NAPCtRkhz3xBg2stulb2SRoYecd+mALs6kl4kZpuu3Yx
	KYXeoLoBST4Qd1qn0IRP6hvWRWiCew28gsydrzzjDR/YLNy67mv0jybYvi2GNXW7
	mK/pw0HAiZodeDkBPUVFj4nP6ws3mCGf8whYWnZmZMefH3Derm+7tYlbwWccar+1
	m5MkSm18vnAsWHYZ9YcFNqYJpcbuXx5HXwUggskUT2Yze+HA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk19xa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 15:38:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so3381005b3a.0
        for <linux-firmware@kernel.org>; Mon, 18 May 2026 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779118679; x=1779723479; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCCZ5HUUrpDihIT3hton1GSM4BZ3XI4quqsj4TgrZOA=;
        b=gyiQ7MaPCZCHz2jw2X4L75AL6T/dciS0L22ugU9jK1Bd1ACZMlIUF9z5jCgd7/TVwG
         5FIyq4QXKb3X77OFVmYm3I8FXnhZm/B6JHLOybOPqYvLBN1YYvlg/0ZuNTpaq84+iF71
         tPy5jp5oX4polnFv2Nc4Fz8TFkDCbnihnHz5NsQUXzj1olUezAmGryIDiL+3T4IZouN7
         KszthIJPVW1U/ggBCTt38Qoi3RHf8sDEo6qjLZUA/dn6qJSL6Vjj+TXiXFHRH5s8sSON
         NP0oADQcB3ENPTfqhNKI8v/Qo57ZRHWf3/aED+HWGzUC2q1bWnG7si14QGkjL33vGfIs
         0hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118679; x=1779723479;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCCZ5HUUrpDihIT3hton1GSM4BZ3XI4quqsj4TgrZOA=;
        b=Z9BreFJ6hJU5dSjZMDpQZWpNH0lD1Rt4SqUN9mV1LshZF8imBFHyvTs/ccf6R2IMEO
         2qkixmYCg+KeI3lkHuzE/B5RPwk6AEo6/qnkjC6a3nec02QUWz6BAIKtFJxzf/EMVBCW
         sV655JsYDrIjwX0b0YxRbL6J8j47S9ybf89TXaHnm6KjCo6G2U5sm87sASKxEKkOudvW
         FmmeS8YtwWmppSQeZw5EH4/NEFzG3Qh2QJrjO4V2eep5LsTTA7/3aQBUjniOccZKPtDw
         jMw46oiEHKzcIQd5va7VaYtilUCqTzvlSkDBD2CI0lRxp05fRiSyfAAZpf6kXB8g/sQz
         2OtQ==
X-Gm-Message-State: AOJu0Yxhs/hzK41Biut2EwwZCHq85CcoujRp7oIz2EaRHcAo/60fT7zd
	8Ap3BZmO0QPJKtRexIUJoSXz2d2P6hieemStpA3wjjmBEMDBNa2+S/q6QpU7I8F4gZ/266rGB2G
	jnZl8WPAp8Um7AjtzVcwQVblJVWNHsOWRYhayWmkUu+3gi1HRprBkFcVIV1oeFoJFWZPE8Cw=
X-Gm-Gg: Acq92OFEWFQjQgw+jEoJQ39QCiz7zivLUKF8gi3HD3MxSNx+UWT0vMKU2EfvhABSq2y
	J+lVo0b3IzrPQac8LyuAnTksZ8HuKbzSxyretaDfrvhz7gMth9sfNCCNOIImmHP0JzqdmM5mvRZ
	dM9ubtrULVvOz/QTftCjT7t/O6EV2yW+4iNG+6nXkjLY3eaQecJpg70ktysN24qfNUeyKM7TCQm
	Ay+37lz5ZwBY3SYVnbHOVlZ/03U5aTD5gdqUImag3TEHRJOe92ELskLGlD+tgCsW1srrw02GKS5
	rlASYrK6SfuSfA3r83bywTPb8UfHJfBDR9+3WnePJ6T4iFhdsN9sRIEzJyn9NOBufnqEYg+/FDq
	jyulilmrZrlsEBCv0OqHejcUus0aIRgG+Agl6ue/MTxiNbtGKUpI=
X-Received: by 2002:a05:6a00:14c4:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83f33c9570fmr12494063b3a.21.1779118679416;
        Mon, 18 May 2026 08:37:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c4:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83f33c9570fmr12494012b3a.21.1779118678766;
        Mon, 18 May 2026 08:37:58 -0700 (PDT)
Received: from [10.216.22.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm15012490b3a.35.2026.05.18.08.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:37:58 -0700 (PDT)
Message-ID: <e604d18e-48b9-480d-8693-625009082c39@oss.qualcomm.com>
Date: Mon, 18 May 2026 21:07:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NCcBzpxl0YR8-CGYlGlh6cKk7lmv6NTb
X-Proofpoint-ORIG-GUID: NCcBzpxl0YR8-CGYlGlh6cKk7lmv6NTb
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b3258 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=E87kyKzIUZF54U7bst4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1MyBTYWx0ZWRfX76dciM1GPrtj
 1WP7eT/D3aOSbX1Hns+Wq8gZpyGGuOvTaR5xWWgReMnpkVBFx0FpXP9yznP/j9BHXF4tcxxBlg/
 Lgypo1JkJWNqOHci2+O5OVZG9TPTKkq6uUmSaQKrBSQOvO46mZQwdENDJxy6aE+nb/4Ke39e/XY
 5PFJeX05lTsG7zXb5DOrtaz+3BR8mWMmMztzwZkZc+ZOuIuCyhz8PLZR/UNHlDujD9U7FYU/DOP
 NE+YS4xXJgqXoDU6WUuopMMCjjSCcMITRY5hXHelgMBkHIBEs1PhTd34Pfy0vqp83HGoZnwaQJp
 9XeeruP1baBmL66mbwQ6W9Tegg95ua9fYLOWjUt3QRj77xvQ6pT0ZGnF1Q/3RSPUrLflker/KRJ
 X8UQ21R0X+kAckQfxc3Syr9STAs88EGOnrnPahfltWDY5p73AFTdQgRCtPKufsyU4y5H0uUDlI6
 QdrufMuSmpjaDLvXl4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180153

The following changes since commit 5b2bc2e7d14c56e14c59a3d6e7b5b0641dc45c88:

   Merge branch 'robot/pr-0-1778742898' into 'main' (2026-05-14 09:15:02 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-shikra

for you to fetch changes up to 72a98ba4050396822df153ed47c45963ded3bcf7:

   qcom: add CDSP firmware for shikra platform (2026-05-18 21:05:42 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add CDSP firmware for shikra platform

  WHENCE                |   3 +++
  qcom/shikra/cdsp.mbn  | Bin 0 -> 2614680 bytes
  qcom/shikra/cdspr.jsn |  22 ++++++++++++++++++++++
  3 files changed, 25 insertions(+)
  create mode 100644 qcom/shikra/cdsp.mbn
  create mode 100644 qcom/shikra/cdspr.jsn
