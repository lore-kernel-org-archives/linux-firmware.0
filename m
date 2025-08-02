Return-Path: <SRS0=Iq2n=2O=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950DAC87FD2
	for <linux-firmware@archiver.kernel.org>; Sat,  2 Aug 2025 10:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6290CC4CEF6; Sat,  2 Aug 2025 10:21:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A31CC4CEEF
	for <linux-firmware@kernel.org>; Sat,  2 Aug 2025 10:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A31CC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fVWF008904
	for <linux-firmware@kernel.org>; Sat, 2 Aug 2025 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=YYJrVw9YRRAIGrvFgEr43rjxNu674M0HGVnvjRHWxco=; b=K7
	n7de0+PpOUtZ71hHCL3SNSLxNywdVztJbqI3gnyYctnobNeQSpXz7Q0I2e2vcmN7
	EazeEff3OndRk4Qsb4kQWUgMmIMccpqyum9hvqowpMHtC0QcpxZd5JEhBDzeX/OE
	tMhGtCqH54tWeboXWXqLW5o2jealb4WL//Q7Dfo8wF3Jcw4JOt5W/CzxbqILy8Cl
	9h+1JBFHfYHSlawV72ZTDWwDxjSi28OpNVW2W3ZWG9fTs8B8wpdrHOKJ0O2ix6EB
	qIZL2GZu3rLs4ztPYeT4XgD+9tgshOEkVRsNPIr1t1XS4TxrzJDpevrJg0reMasW
	fC3IIVcfxahMzH+Xv4jA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a0kk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 10:21:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76bb73b63d2so2577330b3a.1
        for <linux-firmware@kernel.org>; Sat, 02 Aug 2025 03:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754130074; x=1754734874;
        h=content-language:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYJrVw9YRRAIGrvFgEr43rjxNu674M0HGVnvjRHWxco=;
        b=gTbjJpyZA70Pl+2wHRjq2fgYg2gQIWSreamy8SLRf6oQloAoo1YTQu3ol0++im9qAa
         ZkdWQ/FOdzLv2VqwDksLBXLGxomYdl3xuDmp3WkpF+5TC1ZmvUpMnAP+MPO4HfbLYCNd
         G5jZpKynW4dG1tn4jzVslEimGbve7Oo/xFYhSeT8GDs1ZP8bUHDnLDNaRLuryc6DWOwc
         unc/k6O2GzgXuv3YaGGL/keYuhSeVe5kypFq/0qC5PihJPzAEUM+vOba7+Q4VgHza3Uj
         3JamhqMnj9eBsCg0Zdqbgb1dNPJy9LSL5jAsZMdqWJQkYZxPgzYhjGlguD2jVcNvG5FO
         qFAA==
X-Gm-Message-State: AOJu0Yw2/WQWAjWPrcI167PfwQAKC9rtRCrOEaBtGH/nAmjPLgwLnhpd
	Vj5Cmf4lQZj370Jt7oy0XzNORdWlmlNCgefK7T8csIBSNs8oTdGtnqUHYmP82Ou2qPfntuPZuLf
	+KdUi0REEJV+eXRndTAiChGBQnOmRUw9A+THksXJmwIigktkPlQ904psn+Svs1JHDzWYipc4=
X-Gm-Gg: ASbGncuVq7KHmlJtZQyWj4G8NFRbzi0TcuZiZXKitEyfKHAHMHgzAXdOP43pp1im424
	Y7dQjSHRSwBcJzfugM8yS9tp7hmmQwG+4PaZkG+QjfVyin6cIm7sCuvvVgJ56Ed3LKxK1UbyoxL
	4eRdDu4ptVNECzW5eSbDyUPqqVaD9tMDqOcLQ8jh0vW/8YqjXMjLv1OuYVn1AkenZCxsJYP8iT8
	l86gHF9PmBDQqdkVq+yzJKOqWWiU5cbq12pIR5pcPVzlfBOXvlFqQoukpQyLR537Pq7exROZiA4
	VO5a6vXD71odwc7pwVekF994x05ln+kmGg6IpTXM2nEiK6L2INAN+aLJdz6fxHOzk9XRzDaTsg=
	=
X-Received: by 2002:a05:6a20:549d:b0:237:90ae:82de with SMTP id adf61e73a8af0-23df8fca563mr3463012637.16.1754130074227;
        Sat, 02 Aug 2025 03:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG19OU8TN42jZUFHmZytws7NaKaElgB15irbczXK0xB94qzO0okOryOjACxT0iG/Al3gVEGSw==
X-Received: by 2002:a05:6a20:549d:b0:237:90ae:82de with SMTP id adf61e73a8af0-23df8fca563mr3462976637.16.1754130073491;
        Sat, 02 Aug 2025 03:21:13 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd1d4e312sm5632713b3a.17.2025.08.02.03.21.12
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 03:21:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------q3cXSVOc0eaPlPjZh30ol0cs"
Message-ID: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 15:51:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PULL]: Add QDU100 firmware image files required for booting.
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Language: en-US
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688de69b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=2OwXVqhp2XgA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=NEAV23lmAAAA:8
 a=Z3DPM0WN8npsoPi-nAIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=77de7REs_kn_hPMlLE4A:9 a=b4LZFFdtZXNnulsv:21 a=_W_S_7VecoQA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ri1h5sWK-shjxamNcz846fnYD7bjFjSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4NiBTYWx0ZWRfX4rgsTK0M+w/D
 qZjOW7aWVsfBCQGg9ZKq3vtYefOeo8S9xPS1EJot8usZivv0OyjuyOabNZUuw7371ef4VKt7fPf
 sbjsaFHSAz+O8Y6p7dpn/rXRxpCgm40TmCij37UmxNXtSoYLwKeK53LdaTQsj5JirsSDRVTkt1P
 Bby527GF0gebSsuz+ukCR+qOde5tpC4dIlKb29rXbs7M1qwXRxji9py21tO+cORL2uix7Ma5Ndk
 nJmvkCbMbYTP/6tWrtupqhE88admGoUMU9aLWDFoqvIbIVxnFhlMDFs1krFxaUznOsmUrecyXZv
 f6n/7SltlDLjzk5ztb5Mzop+9oDiZBKABXbrPCnQOJ1LwDbnt8PSjJQdeKPfRer9/87nubJNiNs
 s4Fn+Ik1R9rXRVPqZNiKJYsVSXe5IcWfCYzTZdrk9cSS0Sa0YXUP4pBJV4+Fz0/0aQ8Amfg2
X-Proofpoint-GUID: ri1h5sWK-shjxamNcz846fnYD7bjFjSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020086

This is a multi-part message in MIME format.
--------------q3cXSVOc0eaPlPjZh30ol0cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:

   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 
+0000)

are available in the Git repository at:

https://github.com/kishorebatta-ossqcom/linux-firmware.git qdu100_firmware

for you to fetch changes up to dcec874b15615bdde99acb9f2d39572eb14f4c24:

   qcom: Add QDU100 firmware image files required for booting. 
(2025-08-02 15:39:06 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       qcom: Add QDU100 firmware image files required for booting.

  WHENCE                          |  21 +++++++++++++++++++++
  qcom/qdu100/abl_userdebug.elf   | Bin 0 -> 212792 bytes
  qcom/qdu100/aop.mbn             | Bin 0 -> 510944 bytes
  qcom/qdu100/aop_devcfg.mbn      | Bin 0 -> 12136 bytes
  qcom/qdu100/cpucp.elf           | Bin 0 -> 68576 bytes
  qcom/qdu100/efs1.bin            | Bin 0 -> 512 bytes
  qcom/qdu100/efs2.bin            | Bin 0 -> 512 bytes
  qcom/qdu100/efs3.bin            | Bin 0 -> 512 bytes
  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 0 -> 20328 bytes
  qcom/qdu100/hypvm.mbn           | Bin 0 -> 1358672 bytes
  qcom/qdu100/kernel_boot.elf     | Bin 0 -> 49004344 bytes
  qcom/qdu100/mdmddr.mbn          | Bin 0 -> 81960 bytes
  qcom/qdu100/multi_image.mbn     | Bin 0 -> 12088 bytes
  qcom/qdu100/multi_image_qti.mbn | Bin 0 -> 12088 bytes
  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 0 -> 7992 bytes
  qcom/qdu100/qupv3fw.elf         | Bin 0 -> 56432 bytes
  qcom/qdu100/shrm.elf            | Bin 0 -> 82428 bytes
  qcom/qdu100/tz.mbn              | Bin 0 -> 3186640 bytes
  qcom/qdu100/uefi.elf            | Bin 0 -> 2666296 bytes
  qcom/qdu100/xbl_config.elf      | Bin 0 -> 225368 bytes
  qcom/qdu100/xbl_ramdump.elf     | Bin 0 -> 749464 bytes
  qcom/qdu100/xbl_s.melf          | Bin 1424292 -> 1444772 bytes
  qcom/qdu100/zeros_1sector.bin   | Bin 0 -> 512 bytes
  23 files changed, 21 insertions(+)
  create mode 100644 qcom/qdu100/abl_userdebug.elf
  create mode 100644 qcom/qdu100/aop.mbn
  create mode 100644 qcom/qdu100/aop_devcfg.mbn
  create mode 100644 qcom/qdu100/cpucp.elf
  create mode 100644 qcom/qdu100/efs1.bin
  create mode 100644 qcom/qdu100/efs2.bin
  create mode 100644 qcom/qdu100/efs3.bin
  create mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
  create mode 100644 qcom/qdu100/hypvm.mbn
  create mode 100644 qcom/qdu100/kernel_boot.elf
  create mode 100644 qcom/qdu100/mdmddr.mbn
  create mode 100644 qcom/qdu100/multi_image.mbn
  create mode 100644 qcom/qdu100/multi_image_qti.mbn
  create mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
  create mode 100644 qcom/qdu100/qupv3fw.elf
  create mode 100644 qcom/qdu100/shrm.elf
  create mode 100644 qcom/qdu100/tz.mbn
  create mode 100644 qcom/qdu100/uefi.elf
  create mode 100644 qcom/qdu100/xbl_config.elf
  create mode 100644 qcom/qdu100/xbl_ramdump.elf
  create mode 100644 qcom/qdu100/zeros_1sector.bin

--------------q3cXSVOc0eaPlPjZh30ol0cs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Consolas" size="2">The following changes since commit
        910c190740916a9969ad5105137fb88ae4ce34c8:<br>
        <br>
          Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30
        00:18:22 +0000)<br>
        <br>
        are available in the Git repository at:<br>
        <br>
          <a class="moz-txt-link-freetext"
href="https://github.com/kishorebatta-ossqcom/linux-firmware.git">https://github.com/kishorebatta-ossqcom/linux-firmware.git</a>
        qdu100_firmware<br>
        <br>
        for you to fetch changes up to
        dcec874b15615bdde99acb9f2d39572eb14f4c24:<br>
        <br>
          qcom: Add QDU100 firmware image files required for booting.
        (2025-08-02 15:39:06 +0530)<br>
        <br>
        ----------------------------------------------------------------<br>
        Kishore Batta (1):<br>
              qcom: Add QDU100 firmware image files required for
        booting.<br>
        <br>
         WHENCE                          |  21 +++++++++++++++++++++<br>
         qcom/qdu100/abl_userdebug.elf   | Bin 0 -&gt; 212792 bytes<br>
         qcom/qdu100/aop.mbn             | Bin 0 -&gt; 510944 bytes<br>
         qcom/qdu100/aop_devcfg.mbn      | Bin 0 -&gt; 12136 bytes<br>
         qcom/qdu100/cpucp.elf           | Bin 0 -&gt; 68576 bytes<br>
         qcom/qdu100/efs1.bin            | Bin 0 -&gt; 512 bytes<br>
         qcom/qdu100/efs2.bin            | Bin 0 -&gt; 512 bytes<br>
         qcom/qdu100/efs3.bin            | Bin 0 -&gt; 512 bytes<br>
         qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 0 -&gt; 20328 bytes<br>
         qcom/qdu100/hypvm.mbn           | Bin 0 -&gt; 1358672 bytes<br>
         qcom/qdu100/kernel_boot.elf     | Bin 0 -&gt; 49004344 bytes<br>
         qcom/qdu100/mdmddr.mbn          | Bin 0 -&gt; 81960 bytes<br>
         qcom/qdu100/multi_image.mbn     | Bin 0 -&gt; 12088 bytes<br>
         qcom/qdu100/multi_image_qti.mbn | Bin 0 -&gt; 12088 bytes<br>
         qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 0 -&gt; 7992 bytes<br>
         qcom/qdu100/qupv3fw.elf         | Bin 0 -&gt; 56432 bytes<br>
         qcom/qdu100/shrm.elf            | Bin 0 -&gt; 82428 bytes<br>
         qcom/qdu100/tz.mbn              | Bin 0 -&gt; 3186640 bytes<br>
         qcom/qdu100/uefi.elf            | Bin 0 -&gt; 2666296 bytes<br>
         qcom/qdu100/xbl_config.elf      | Bin 0 -&gt; 225368 bytes<br>
         qcom/qdu100/xbl_ramdump.elf     | Bin 0 -&gt; 749464 bytes<br>
         qcom/qdu100/xbl_s.melf          | Bin 1424292 -&gt; 1444772
        bytes<br>
         qcom/qdu100/zeros_1sector.bin   | Bin 0 -&gt; 512 bytes<br>
         23 files changed, 21 insertions(+)<br>
         create mode 100644 qcom/qdu100/abl_userdebug.elf<br>
         create mode 100644 qcom/qdu100/aop.mbn<br>
         create mode 100644 qcom/qdu100/aop_devcfg.mbn<br>
         create mode 100644 qcom/qdu100/cpucp.elf<br>
         create mode 100644 qcom/qdu100/efs1.bin<br>
         create mode 100644 qcom/qdu100/efs2.bin<br>
         create mode 100644 qcom/qdu100/efs3.bin<br>
         create mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf<br>
         create mode 100644 qcom/qdu100/hypvm.mbn<br>
         create mode 100644 qcom/qdu100/kernel_boot.elf<br>
         create mode 100644 qcom/qdu100/mdmddr.mbn<br>
         create mode 100644 qcom/qdu100/multi_image.mbn<br>
         create mode 100644 qcom/qdu100/multi_image_qti.mbn<br>
         create mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf<br>
         create mode 100644 qcom/qdu100/qupv3fw.elf<br>
         create mode 100644 qcom/qdu100/shrm.elf<br>
         create mode 100644 qcom/qdu100/tz.mbn<br>
         create mode 100644 qcom/qdu100/uefi.elf<br>
         create mode 100644 qcom/qdu100/xbl_config.elf<br>
         create mode 100644 qcom/qdu100/xbl_ramdump.elf<br>
         create mode 100644 qcom/qdu100/zeros_1sector.bin</font><br>
      <br>
    </p>
  </body>
</html>

--------------q3cXSVOc0eaPlPjZh30ol0cs--
