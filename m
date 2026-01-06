Return-Path: <SRS0=SIAy=7L=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC24BCDC193
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jan 2026 12:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F723C19421; Tue,  6 Jan 2026 12:43:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF11EC116C6
	for <linux-firmware@kernel.org>; Tue,  6 Jan 2026 12:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF11EC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069r0bj2429874
	for <linux-firmware@kernel.org>; Tue, 6 Jan 2026 12:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=D7jSFI2aiTBTER5Kekt0fbOh4FN/KB81qZWivP2JooI=; b=gK
	sWtZ0huD3DGtthzKhWl1mU4Jak5FVo3w2ngEfVtdy2Ou+57q3LZ8qm07QdEQSbsF
	pNP6Z18nT6CTkPpD6c1uEhOmsXRhkK53wVDlO1kRaVGzAI1cYBOpRY5NNdTw1hLy
	jAfkpE4V/wYRDqFSt1Ag0ZMn+ZUbB05hZFb/Tc7PmOJk/Iue+ZCegdXhyelv40gB
	3CiauthXW+ny06lrVyBHE8uAWByDkm59Xh+Gg9fLiuRYvLVGuNY5S2YpNyT7Vzuk
	Bs1yDUqG07PcuVhTSuNS4rxykT/VvvU5Ml9h0RrH4hJSlumpI02srqd3W86U3hlI
	N1FwuNGBdY6a9IvpnDeg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr739ujk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 12:43:16 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-65eccb3f95cso2485197eaf.3
        for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 04:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767703396; x=1768308196; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7jSFI2aiTBTER5Kekt0fbOh4FN/KB81qZWivP2JooI=;
        b=jZ49LbbP3WTsSHxrbi2m3fVPpf0JhDn24Z6hN501/CHAVGKTU5OUbkxEXhN2oV0E7r
         7VNRobdSPpZgkrVMGOKn5GKIbVen99J0hXXcM9/wU7vrPo/lDN7bclI1UQGZNvWHLxRk
         H2dmk6NdZp4yh1dh2jWfd0q+d0h+6dmvE8QXtEF213JmHY2RvhRhEZoZded25Ax2IHID
         Xv/ZZVjba/HOVCTqHuv0oo0HoitEcu8zVpoV+9258lMsppJpfFBk+LwcycQdGDAYbi4A
         GEq89pOjB4+nlQcAaWYvfeLFNrPQaNWEnRRn62X53orbxk/lFQHRYfIKTUuvI9cHIuKy
         q8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703396; x=1768308196;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7jSFI2aiTBTER5Kekt0fbOh4FN/KB81qZWivP2JooI=;
        b=GF0GouvdJyqQvYT2CcdhdYoIOodpfH6O/5JGf+jDD4MopKIDeEUYtnbin0e+9GXG7k
         egOVB7+eJfgpMPCX1kkp9rSRS15GO5MBZS2nrPZSJVlByIh0jm90q/cKflwRlWV8Kfb+
         GJ/fjIhbAWSEOytN4K27XK1S24K9Bdifjco4wJnFfyaPsdwy6E8QJz10Hd83kIgOierb
         uDnFYsTI53sCL2XJV9+lwhkB/ktjxX9NCzosl+eKe9RIFunvoUF03TXSzasZ/04ownWf
         96LuPFXKL8VJO7QlRIQWocBDZcPAc6Lku5+GeGFP8vfLiz0RgY8Q6Gk0LCB5fv9Qt1q/
         m6qw==
X-Gm-Message-State: AOJu0YwGp86v/sswCrtkEi/aau2xrfYyCY+VWp8se3kkWAIKxspVzUYK
	d8vti2gcjt9kvifNtnTsCKyeYdfCCT0ESMT4hxg3YbvQ1xwi4fbnaaM6LNT4C/oJKGmKx7D58hb
	YWS5YEKEZcVzom1ZbiK9CEhyU1IDJYhbY1gcSlVpC9Qm3ZjbwkmRICdmnQLO0O59N7sSX8kFYeY
	56sON6EMy+r+OxW3kj2TF4qSSTxZM8q+vllvpDF1rxRg7aUhHZ
X-Gm-Gg: AY/fxX6+yK+RcBTaodEL/R9ZYvQjQjUg5niUoOUcAAyKcSHcXWxitmVdNimcX8oRPik
	m8kq7/NNDNNNEGJtuKoxS5KJVfXRWwmqTwemzpqJdVf82SA/1YUbztw2OECBePQO5XR+9A8jjea
	/v41EOphj16ir8EBLA6iEwDKJYKvwEBj8/15iWVPrYD5LgE9yUiplHKEBIHiYBCdMaSRQ=
X-Received: by 2002:a4a:d1b8:0:b0:659:9a49:8fd6 with SMTP id 006d021491bc7-65f47a54be9mr1388617eaf.79.1767703395784;
        Tue, 06 Jan 2026 04:43:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQUwEWGTdhghfonfdyNaus7K2g2d3qZDtSBjpL0kuYT5AAmlGqhbtY7UK8elWWCiGtZx/mNn47GxdliXGYyi4=
X-Received: by 2002:a4a:d1b8:0:b0:659:9a49:8fd6 with SMTP id
 006d021491bc7-65f47a54be9mr1388609eaf.79.1767703395456; Tue, 06 Jan 2026
 04:43:15 -0800 (PST)
MIME-Version: 1.0
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 18:13:03 +0530
X-Gm-Features: AQt7F2plf35myVfY9a1SEitTlMfUITGzv5afzk9zeDcn6r8c8iKPPyXDVrFowI0
Message-ID: <CAPiVHHi9ysios_oubHtY0aWzFubc6L4X11JM5hyAyFsk6QniqA@mail.gmail.com>
Subject: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to 1.1.3-00105
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695d0364 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=YnOtox9qGvgJYLaqA4QA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: zAdjU3SmVHb3_7vt4aaUzL9Afh3mHYm1
X-Proofpoint-GUID: zAdjU3SmVHb3_7vt4aaUzL9Afh3mHYm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExMCBTYWx0ZWRfX6faP9cFcdtvH
 iRytiIbMIN2nrsFdtmfQ7fVzO+mgbLvNaZRVQzzfrEUcDJ3xpyjgiaZuWwiYLr2lqXLCeeNfTEg
 1VhdLm/RnArIJQa0zl17jd5zFZ0cPVPgjCoFw1Lc6RujVXKf9pXuPNVoUMyAMw/DDmAGUryfedi
 9QjbTUvItE6oma+/mW1aqpDx4hwBR3MdtnLZXy3zMBWZ4cXbGneZP/I1MP/iIFyaKEMUkfd8xz0
 5EdF8po1DTJCP8RNmY7kMRDt86VUNGfhLR7B7aKjyvshS6rvc02VmzId51wYPPUBegjWoJn8Gj9
 b5rNF2v6eB/Pr0ga0Mdmy5MFEef6Hd9O/DpcqOgDUVeoUTzHj0N1SzYMWq6F16hkEZS1+0asJ1s
 Jxe/8CJbNlnBmfapr0rL6I6AJPTlOr1sPxt0ilGmhwV4SwqoXJR5lqgnXAUwXK4wVv2Upx36WlB
 OPQBX+VfjjJ4pfcS4Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060110

Hi linux-firmware maintainers,

 Here's a pull request for bluetooth firmware. Please let me know if
 you have any problems.

The following changes since commit 7e7fd7c891902d6fb8b0c93e27afaf4e023b6025:

  Merge branch 'revert-qdu100-kernel' into 'main' (2026-01-05 23:38:11 +0000)

  are available in the Git repository at:

  https://github.com/quicjathot/bt_msl_fw_1.1.3_00105.git

  for you to fetch changes up to b85e1561bdfc1efb02b4377161c850b075d6d4d4:

  qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to 1.1.3-00105
(2026-01-06 17:18:48 +0530)

----------------------------------------------------------------
Janaki Ramaiah Thota (1):
      qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to 1.1.3-00105

 Thanks,
Janakiramaiah Thota
