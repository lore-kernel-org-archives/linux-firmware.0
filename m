Return-Path: <SRS0=STX2=DQ=oss.qualcomm.com=dishank.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10718CD4F5B
	for <linux-firmware@archiver.kernel.org>; Tue, 19 May 2026 18:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B8BDC2BCC6; Tue, 19 May 2026 18:24:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9721C2BCB3
	for <linux-firmware@kernel.org>; Tue, 19 May 2026 18:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9721C2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwiPZ1725558
	for <linux-firmware@kernel.org>; Tue, 19 May 2026 18:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ydS0U7FzavgeD5Qg/PeoZEEkdYCJ1UsCG7/PMNRKJHE=; b=jb
	3mOMitsaDVF4CNiRDqy8RbrIipD+y/nDaqXV3P7AcD3UpyMfIO5sMSfpUZMR1Ou3
	C0pCMqVcoROJDoAu4Z89j2jjCqVcR7k9H8vsorl83wzih+ooMkoDBUay1Y+eRvmr
	3M/RnsgrSWSWzOXk991vltx/QdLx1VbiHKmzM2S78twIlc1WkYZvHb26+xpq17UO
	h45FuX461cJMhyDEaLhepdS7Ww0IVD/4Y41eHn3KMjvkT2Y3bt9JcyQJ33UHJlyd
	Gqth+6vbAFmdSTvZszgSNB7TmzCzFIFwr+wiQCCuINj4j8fPPAHWTvYuMyHv7uGp
	sDaOCSA7/6y8Oapgxj1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qgx93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 19 May 2026 18:24:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so4676409b3a.0
        for <linux-firmware@kernel.org>; Tue, 19 May 2026 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779215077; x=1779819877; darn=kernel.org;
        h=content-language:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydS0U7FzavgeD5Qg/PeoZEEkdYCJ1UsCG7/PMNRKJHE=;
        b=YWNB1gBpyosgzAC83/Zq4ejuFXjyKL9VLMd4ChF+P56FXtWxhwOQa0kyHsMwfSA/FM
         TfbeICNN3lpWmMTtV5H1XphPOUPjSXY9WcEEvBJ9qtAf/sjFts9RrA0x5oLx+F/3+H04
         SW2GeWuV+0IVwdxTj5NRBkeTAZoqz0rAbiCDcoK0+cKH/89qq5iLd0HvOTgLcxkVjGph
         TA9aXKdpcwrE2jebhaE1ztRw8LPDe6ZSJSJk9lv8RW0mTXdf38HbdXTC6Fvx3dng6aJM
         HoqpOPxGuILcERO3XO9bgIP30k4Lq9XHLLf+8FCXFXMJR54MZBaDKZAcSNR7egNBqMp+
         4EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779215077; x=1779819877;
        h=content-language:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydS0U7FzavgeD5Qg/PeoZEEkdYCJ1UsCG7/PMNRKJHE=;
        b=FjzbrK9HcgZ5u1IgaHEocnPIJKNoWBisFCt22v4M/GfZFD46c93Oo5XneyGejNi/Lv
         9TA5YgJbSL/LBBB73BLr1/AEFVqP2lQA1dVZz9lIy++wg4OW6ZoiifPWhVlCLTulKKoT
         uKCcQulh4kXQJKGlaRl5kQM+aMCnnwXm6mT+35Tp2jySjmDMRUXiiAJR4it/n3oB24EF
         /6phCIWk4hnwVXlbECQ1b3clmL2cCO65fsetrCSP8VeXvtT+qBnnpxmnNK6IOa6VO21E
         bCUGXo719uGPFEplsILEGsLVN+UMBir4hdKa9kX9FVjnuu/WDyOgTR4tNglm4UzsN6nJ
         Qldg==
X-Gm-Message-State: AOJu0Yw+ip6WN4D5QGB4m5BaBgKwRLiGdXVkBDJ/3bEyFYxNakDCo5gr
	MlVA8KsoHSNJiYeop0v3tHdjKjH9fFnJHV/h48klGzSvd9HX6OA1dfL+hwMQHGyDkvUuyCwVYtE
	mI26tWduY5EI4YWkWmRSGC83QLZKrytdRqS0saxZUtENkWanJq3DKv1xQg2d4qXWhouBnV98=
X-Gm-Gg: Acq92OFPJzsKO9wUfv/NDO8yaNlkPG8PZoNrqvImceQ/5RxJobx/zFUWtYppbuJ0V9O
	ESyDqk26SAsZc9WCkdzA5r1h3d61UxId9jCwCzTzQvgabM03jm+UNXXC51kpw0DxDFY3Cmg+frw
	HFsX13jAHA2NiegGALynub6tY96QyTdnWxt+/zCR94Qc/8WkbHpdeTAVme9+DSwIJlJp3rdOjXH
	JLn4H6vBWFG+4hJmSfYh7Ic3hoCxmPWSzWrPUMoMrRmYhOo5ORXuEw7JuDLhYXKH05j2rLD8Cb+
	v7gYNmj4RPJ17aYeTKTNWphRVnymQhneXCUhg5DlWJvng2dDrR9f9F2GmasgS7eizrwQWHb6pjj
	e89Kr8g1/GnbYcj8GbIRpkMKIUua7KUozuUaQngelhk7NaLbrJWrO
X-Received: by 2002:a05:6a00:288d:b0:835:3861:812c with SMTP id d2e1a72fcca58-83f18ea05e5mr19689698b3a.23.1779215077053;
        Tue, 19 May 2026 11:24:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:288d:b0:835:3861:812c with SMTP id d2e1a72fcca58-83f18ea05e5mr19689675b3a.23.1779215076471;
        Tue, 19 May 2026 11:24:36 -0700 (PDT)
Received: from [192.168.29.143] ([49.43.232.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm17681795b3a.39.2026.05.19.11.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 11:24:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xz8rHahBdnqiEMtV6qeo9EE8"
Message-ID: <b5daa321-bcb1-43ee-86f4-112a22284663@oss.qualcomm.com>
Date: Tue, 19 May 2026 23:54:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dishank Garg <dishank.garg@oss.qualcomm.com>
Subject: [GIT PULL] QCA: Update Bluetooth firmware for QCC2072 UART interface
 and add BCS calibration binary
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshkov@gmail.com, hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com,
        samana@qti.qualcomm.com, ysiddu@qti.qualcomm.com,
        dishgarg@qti.qualcomm.com
Content-Language: en-US
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE4MyBTYWx0ZWRfX9RumKBob6cXo
 8ElLjCE5GREkBZDjQ1wgR8FfZ/qLKdUdm+zanz0YTe69c+U+A8uLEXHBYHICa5KVuOUjd4tP72u
 0bbgxXCr0bWFG+whJpM1EfQev49Fjy407mHv5MXiTclbZDFAALNiweK7RDm8di7I3Kag4S8LSN6
 SUSn1UMESxAYRR53x65sUhDr/BzjyJVFONrj6u29bfPyYcuqWoeC8lmixAl4dxiFKBOlCal48by
 ajGLHhwxSgkQw9Ujy/LGtL/zWSKNKVjRj3AeXYvbjc//CpghWdUBumL9n/Jat4/u1peYRZSHgjJ
 /EAxnO03Yk/NK6pLk09D8vw+zSYAgBrKiKTGHnOWkKxx5AQs8LRYMS/OV6C1ay15EbwfTAks+o9
 VnnHEuzsTq8fA57NdmC/EifC8VW7VYPvAsY40IzPWB6h4hdy3ku5gyjq/mPVwTuPyUyZxK6CGTM
 6uOqD6qVFpsUdLUk7CQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0caae5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=rVPHjc/N4E3dzGhKvu3xTA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=p0WdMEafAAAA:8 a=-TpWRX8TO05J43PmrckA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-omtkl1EsoltHmdhVi4A:9 a=my8-kmQdfW5Xv1aU:21 a=_W_S_7VecoQA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 7aLBRzr9PToKHrJtzCXHyKTdlmlXwfck
X-Proofpoint-ORIG-GUID: 7aLBRzr9PToKHrJtzCXHyKTdlmlXwfck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190183

This is a multi-part message in MIME format.
--------------xz8rHahBdnqiEMtV6qeo9EE8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

Here's a pull request for Bluetooth Firmware. Please let us know if any 
issue is there.

The following changes since commit d962a6a309b78778f458dc94713845eee105be14:

   Merge branch 'mediatek' into 'main' (2026-05-19 11:33:36 +0000)

are available in the Git repository at:

https://gitlab.com/dishankgargoss/linux-firmware.git HEAD

for you to fetch changes up to ebc6ac5cd8016dcbdb93700742f7861644ef25f6:

   QCA: Update Bluetooth firmware for QCC2072 UART interface and add BCS 
calibration binary (2026-05-19 23:23:29 +0530)

----------------------------------------------------------------
Dishank Garg (1):
       QCA: Update Bluetooth firmware for QCC2072 UART interface and add 
BCS calibration binary

Merge Request for the commit: QCA: Update Bluetooth firmware for QCC2072 
UART interface and add BCS calibration binary (!1057) · Merge requests · 
kernel-firmware / Linux Firmware · GitLab 
<https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057>

Thanks,
Dishank Garg

--------------xz8rHahBdnqiEMtV6qeo9EE8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi linux-firmware maintainers,<br>
      <br>
      Here's a pull request for Bluetooth Firmware. Please let us know
      if any issue is there.</p>
    <p>The following changes since commit
      d962a6a309b78778f458dc94713845eee105be14:<br>
      <br>
        Merge branch 'mediatek' into 'main' (2026-05-19 11:33:36 +0000)<br>
      <br>
      are available in the Git repository at:<br>
      <br>
        <a class="moz-txt-link-freetext" href="https://gitlab.com/dishankgargoss/linux-firmware.git">https://gitlab.com/dishankgargoss/linux-firmware.git</a> HEAD<br>
      <br>
      for you to fetch changes up to
      ebc6ac5cd8016dcbdb93700742f7861644ef25f6:<br>
      <br>
        QCA: Update Bluetooth firmware for QCC2072 UART interface and
      add BCS calibration binary (2026-05-19 23:23:29 +0530)<br>
      <br>
      ----------------------------------------------------------------<br>
      Dishank Garg (1):<br>
            QCA: Update Bluetooth firmware for QCC2072 UART interface
      and add BCS calibration binary<br>
    </p>
    <p>Merge Request for the commit: <a
href="https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1057">QCA:
        Update Bluetooth firmware for QCC2072 UART interface and add BCS
        calibration binary (!1057) · Merge requests · kernel-firmware /
        Linux Firmware · GitLab</a></p>
    <p>Thanks,<br>
      Dishank Garg</p>
  </body>
</html>

--------------xz8rHahBdnqiEMtV6qeo9EE8--
