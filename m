Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9900C77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 13:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFE93C433D2; Mon,  8 May 2023 13:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96642C433EF
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683550989;
	bh=6rhF22bHOvHsMeTZ8zcWsqiPTzjQ0lJNRuAiYY535K8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Acm/MqRZ/ZuOLQsytfhx9JRCIDKbGH/wAELzPaBV2pJPssdVQX3VWHVJI6Nxl7pnR
	 McV6wZBdHQKK5GBgE8s6M49lg+pe2UGF51csPl2FYMka4+Kl9rl6cCY9Not8+UB5es
	 KAYovudjJXBfAnYbVvxLYbNbrWQi69BNKPDcvSAAyumlewb/ZUG0W6aFYh1yiZWEjz
	 9STBxjRD4EZjkmDT9ULJXx/WgdzVhmDdfzKKbKFQqpr9GpMBH8mju/wqhVmR7DctxC
	 ECu3PGttqvuVE06jdTiVRgzdjDeQINlmNdbvsHesRdcDgIWenJL1cJSFfXJoL5CbLP
	 zA4vHrlEfhtQQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so24752906276.1
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 06:03:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDyYHzhh7+gk6Y1+ePAGn3VBrAxHpZQ0saijW2fhrsI21mjVRlzN
	6WoS0Opz/5pJ7Nk8DsMjFC8A6h8JvNbAn8fts2Q=
X-Google-Smtp-Source: ACHHUZ45ygiCeBL5cpaC4ODU2DwFC3eQf7gpQROvMcKKWk+E0vMSCyXQtrVhWNVHAVxYH1Hf+udFgjT03lwIe8yJmFw=
X-Received: by 2002:a05:6902:729:b0:b9e:6c09:2d96 with SMTP id
 l9-20020a056902072900b00b9e6c092d96mr12936041ybt.12.1683550988149; Mon, 08
 May 2023 06:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230331115739.bytw7s35aacgrqic@notk.org>
In-Reply-To: <20230331115739.bytw7s35aacgrqic@notk.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 09:02:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4KPx8TzS5+QZ6ubg__cz9gYKtmR-kFOv9A3HYVS8nuww@mail.gmail.com>
Message-ID: <CA+5PVA4KPx8TzS5+QZ6ubg__cz9gYKtmR-kFOv9A3HYVS8nuww@mail.gmail.com>
Subject: Re: [RFC] global: de-duplicate files with symlinks
To: Adrien Nader <adrien@notk.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 7:57=E2=80=AFAM Adrien Nader <adrien@notk.org> wrot=
e:
>
> Hi,
>
> I initially wanted to post a patch but I think this warrants some
> discussion instead: de-duplication only works if further commits don't
> introduce duplicates. This is doable but also a change of habits and an
> extra step.
> I'd like to discuss this nonetheless in order to reach a conclusion as
> to where is the best place for this de-duplication: linux-firmware.git
> or distributions when packaging.

I've been thinking about this for a while.  Generally speaking, this
sounds like one of those really good ideas that in the end I'm not
sure we're going to be comfortable doing retroactively.

The firmware submissions are redistributable by requirement, but we
take them as they are sent under the terms they are submitted under.
If a submitter has sent multiple identical files in the past, perhaps
they had reason to do so that never played out in the end.  It's all
binary blobs that are effectively impossible to actually review, and
already hard enough to get companies to submit their firmware.

Going forward, we could run a de-duplication pre-check before commit
and ask them to resubmit, but I don't want to go through and
retroactively seek out acknowledgement for previous submissions.

josh

> I ran jdupes on the repository. More precisely the following:
>
>   jdupes -rSHl --ext-filter=3Dnostr:./.git/ .
>
> Summary:
>
>   Scanning: 2900 files, 302 items (in 1 specified)
>   346 duplicate files (in 195 sets), occupying 34 MB
>
> Since these files are often put in initrds and compressed, I've also
> compressed the output of git archive --format=3Dtar.
>
> Compression                     HEAD        patch       reduction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> none                            906240000   871567360   34672640 (3.83%)
> lz4                             505770148   484870257   20899891 (4.13%)
> zstd                            349805171   343648683   6156488  (1.76%)
> xz --lzma2=3Dpreset=3D0,dict=3D8M     278950408   280633320   1682912  (0=
.60%)
> xz --lzma2=3Dpreset=3D0,dict=3D1536M  264220784   264429304   208520   (0=
.08%)
>
> Compression with larger dictionaries is less impacted because the
> dictionary is large enough to spot identical files even though they're
> spread over the place (but distros tend to not use large dicts). It is
> also worth mentioning that duplicates can hinder compression of other
> files by taking space in the dictionary windows.
>
> Overall this gives a slight but noticeable gain with no drawback that I
> know of. The only question is probably whether there will be a policy to
> only push de-duplicated files here and if so, how it will be
> enforced/verified (pre-commit hooks which runs jdupes?).
>
> If this is not done in the git repository, it probable makes sense to
> announce that downstreams should do it themselves. I don't think that's
> a lot of work (I guess I can integrate that in Ubuntu in a few minutes);
> people just need to be made aware they're the ones supposed to do it.
>
> Best,
>
> PS: git --stat below:
>
>  adaptec/starfire_tx.bin                      |  Bin 832 -> 15 bytes
>  amdgpu/aldebaran_mec2.bin                    |  Bin 268576 -> 17 bytes
>  amdgpu/aldebaran_sjt_mec2.bin                |  Bin 268576 -> 21 bytes
>  amdgpu/arcturus_mec2.bin                     |  Bin 268576 -> 16 bytes
>  amdgpu/beige_goby_mec2.bin                   |  Bin 268720 -> 18 bytes
>  amdgpu/carrizo_mec2.bin                      |  Bin 262784 -> 15 bytes
>  amdgpu/carrizo_sdma1.bin                     |  Bin 10624 -> 16 bytes
>  amdgpu/cyan_skillfish2_mec2.bin              |  Bin 268592 -> 23 bytes
>  amdgpu/dimgrey_cavefish_dmcub.bin            |  Bin 112116 -> 20 bytes
>  amdgpu/dimgrey_cavefish_mec2.bin             |  Bin 268592 -> 24 bytes
>  amdgpu/dimgrey_cavefish_ta.bin               |  Bin 218368 -> 17 bytes
>  amdgpu/fiji_mec2.bin                         |  Bin 262824 -> 12 bytes
>  amdgpu/gc_10_3_6_mec2.bin                    |  Bin 268592 -> 17 bytes
>  amdgpu/gc_10_3_7_mec2.bin                    |  Bin 268592 -> 17 bytes
>  amdgpu/green_sardine_mec2.bin                |  Bin 268048 -> 21 bytes
>  amdgpu/hawaii_sdma.bin                       |  Bin 4456 -> 16 bytes
>  amdgpu/hawaii_sdma1.bin                      |  Bin 4456 -> 17 bytes
>  amdgpu/hawaii_uvd.bin                        |  Bin 232752 -> 15 bytes
>  amdgpu/hawaii_vce.bin                        |  Bin 101072 -> 15 bytes
>  amdgpu/kabini_sdma.bin                       |  Bin 4456 -> 16 bytes
>  amdgpu/kabini_sdma1.bin                      |  Bin 4456 -> 17 bytes
>  amdgpu/kabini_uvd.bin                        |  Bin 232752 -> 15 bytes
>  amdgpu/kabini_vce.bin                        |  Bin 101072 -> 15 bytes
>  amdgpu/kaveri_ce.bin                         |  Bin 8832 -> 13 bytes
>  amdgpu/kaveri_me.bin                         |  Bin 8832 -> 13 bytes
>  amdgpu/kaveri_sdma.bin                       |  Bin 4456 -> 16 bytes
>  amdgpu/kaveri_sdma1.bin                      |  Bin 4456 -> 17 bytes
>  amdgpu/kaveri_uvd.bin                        |  Bin 232752 -> 15 bytes
>  amdgpu/kaveri_vce.bin                        |  Bin 101072 -> 15 bytes
>  amdgpu/mullins_ce.bin                        |  Bin 8832 -> 13 bytes
>  amdgpu/mullins_me.bin                        |  Bin 8832 -> 13 bytes
>  amdgpu/mullins_mec.bin                       |  Bin 17024 -> 14 bytes
>  amdgpu/mullins_pfp.bin                       |  Bin 8832 -> 14 bytes
>  amdgpu/mullins_sdma.bin                      |  Bin 4456 -> 16 bytes
>  amdgpu/mullins_sdma1.bin                     |  Bin 4456 -> 17 bytes
>  amdgpu/mullins_uvd.bin                       |  Bin 232752 -> 15 bytes
>  amdgpu/mullins_vce.bin                       |  Bin 101072 -> 15 bytes
>  amdgpu/navi10_mec2.bin                       |  Bin 268592 -> 14 bytes
>  amdgpu/navi12_asd.bin                        |  Bin 172544 -> 14 bytes
>  amdgpu/navi12_mec2.bin                       |  Bin 268592 -> 14 bytes
>  amdgpu/navi12_vcn.bin                        |  Bin 402112 -> 14 bytes
>  amdgpu/navi14_asd.bin                        |  Bin 172544 -> 14 bytes
>  amdgpu/navi14_mec2.bin                       |  Bin 268592 -> 14 bytes
>  amdgpu/navi14_mec_wks.bin                    |  Bin 268592 -> 19 bytes
>  amdgpu/navi14_vcn.bin                        |  Bin 402112 -> 14 bytes
>  amdgpu/navy_flounder_dmcub.bin               |  Bin 112116 -> 20 bytes
>  amdgpu/navy_flounder_mec2.bin                |  Bin 268592 -> 21 bytes
>  amdgpu/navy_flounder_ta.bin                  |  Bin 218368 -> 17 bytes
>  amdgpu/navy_flounder_vcn.bin                 |  Bin 577776 -> 24 bytes
>  amdgpu/oland_ce.bin                          |  Bin 8832 -> 13 bytes
>  amdgpu/oland_me.bin                          |  Bin 8832 -> 13 bytes
>  amdgpu/picasso_mec2.bin                      |  Bin 268064 -> 15 bytes
>  amdgpu/pitcairn_ce.bin                       |  Bin 8832 -> 13 bytes
>  amdgpu/pitcairn_me.bin                       |  Bin 8832 -> 13 bytes
>  amdgpu/pitcairn_uvd.bin                      |  Bin 219928 -> 13 bytes
>  amdgpu/polaris10_mec2.bin                    |  Bin 262824 -> 17 bytes
>  amdgpu/polaris11_ce.bin                      |  Bin 8852 -> 16 bytes
>  amdgpu/polaris11_ce_2.bin                    |  Bin 8852 -> 18 bytes
>  amdgpu/polaris11_mec2.bin                    |  Bin 262824 -> 17 bytes
>  amdgpu/polaris11_sdma.bin                    |  Bin 12692 -> 18 bytes
>  amdgpu/polaris11_sdma1.bin                   |  Bin 12692 -> 19 bytes
>  amdgpu/polaris11_uvd.bin                     |  Bin 375424 -> 17 bytes
>  amdgpu/polaris11_vce.bin                     |  Bin 166816 -> 17 bytes
>  amdgpu/polaris12_mec2.bin                    |  Bin 262824 -> 17 bytes
>  amdgpu/polaris12_sdma.bin                    |  Bin 12692 -> 18 bytes
>  amdgpu/polaris12_sdma1.bin                   |  Bin 12692 -> 19 bytes
>  amdgpu/polaris12_uvd.bin                     |  Bin 375424 -> 17 bytes
>  amdgpu/polaris12_vce.bin                     |  Bin 166816 -> 17 bytes
>  amdgpu/raven2_mec2.bin                       |  Bin 268048 -> 14 bytes
>  amdgpu/raven2_vcn.bin                        |  Bin 365536 -> 15 bytes
>  amdgpu/raven_gpu_info.bin                    |  Bin 316 -> 20 bytes
>  amdgpu/raven_kicker_rlc.bin                  |  Bin 39140 -> 15 bytes
>  amdgpu/raven_mec2.bin                        |  Bin 268048 -> 13 bytes
>  amdgpu/raven_sdma.bin                        |  Bin 17408 -> 16 bytes
>  amdgpu/raven_vcn.bin                         |  Bin 365536 -> 15 bytes
>  amdgpu/renoir_mec2.bin                       |  Bin 268064 -> 14 bytes
>  amdgpu/renoir_rlc.bin                        |  Bin 39928 -> 21 bytes
>  amdgpu/renoir_sdma.bin                       |  Bin 17408 -> 22 bytes
>  amdgpu/renoir_vcn.bin                        |  Bin 401856 -> 21 bytes
>  amdgpu/sienna_cichlid_dmcub.bin              |  Bin 112116 -> 20 bytes
>  amdgpu/sienna_cichlid_mec2.bin               |  Bin 268592 -> 22 bytes
>  amdgpu/sienna_cichlid_vcn.bin                |  Bin 577776 -> 24 bytes
>  amdgpu/tahiti_ce.bin                         |  Bin 8832 -> 13 bytes
>  amdgpu/tahiti_me.bin                         |  Bin 8832 -> 13 bytes
>  amdgpu/tahiti_pfp.bin                        |  Bin 8832 -> 16 bytes
>  amdgpu/tonga_mec2.bin                        |  Bin 262824 -> 13 bytes
>  amdgpu/vangogh_mec2.bin                      |  Bin 268720 -> 15 bytes
>  amdgpu/vcn_4_0_4.bin                         |  Bin 367136 -> 13 bytes
>  amdgpu/vega10_mec2.bin                       |  Bin 268064 -> 14 bytes
>  amdgpu/vega12_mec2.bin                       |  Bin 268048 -> 14 bytes
>  amdgpu/vega20_mec2.bin                       |  Bin 268064 -> 14 bytes
>  amdgpu/vega20_vce.bin                        |  Bin 173856 -> 14 bytes
>  amdgpu/vegam_uvd.bin                         |  Bin 375424 -> 17 bytes
>  amdgpu/verde_ce.bin                          |  Bin 8832 -> 13 bytes
>  amdgpu/yellow_carp_asd.bin                   |  Bin 168448 -> 18 bytes
>  amdgpu/yellow_carp_mec2.bin                  |  Bin 268720 -> 19 bytes
>  amdgpu/yellow_carp_ta.bin                    |  Bin 205824 -> 17 bytes
>  ar3k/1020200/ar3kbdaddr.pst                  |    2 +-
>  ar3k/30101/ar3kbdaddr.pst                    |    2 +-
>  ar3k/ramps_0x01020201_40.dfu                 |  Bin 264 -> 23 bytes
>  .../hw3.0/notice_ath10k_firmware-sdio-6.txt  | 1353 +----
>  .../hw1.0/notice_ath10k_firmware-6.txt       | 1353 +----
>  .../hw1.0/notice_ath10k_firmware-sdio-5.txt  | 1129 +----
>  .../hw1.0/notice_ath10k_firmware-5.txt       |  329 +-
>  .../hw2.0/notice_ath10k_firmware-5.txt       |  590 +--
>  .../hw1.0/notice_ath10k_firmware-5.txt       |  590 +--
>  ath11k/IPQ6018/hw1.0/Notice.txt              | 4095 +---------------
>  ath11k/IPQ8074/hw2.0/Notice.txt              | 4095 +---------------
>  ath11k/QCN9074/hw1.0/Notice.txt              | 4095 +---------------
>  ath6k/AR6003.1/hw2.1.1/bdata.WB31.bin        |  Bin 1792 -> 14 bytes
>  ath6k/AR6003/hw1.0/bdata.WB31.bin            |  Bin 1024 -> 14 bytes
>  ath6k/AR6003/hw2.0/bdata.SD31.bin            |  Bin 1792 -> 37 bytes
>  ath6k/AR6003/hw2.0/bdata.WB31.bin            |  Bin 1792 -> 37 bytes
>  ath6k/AR6003/hw2.1.1/bdata.SD31.bin          |  Bin 1792 -> 37 bytes
>  ath6k/AR6003/hw2.1.1/bdata.SD32.bin          |  Bin 1792 -> 23 bytes
>  ath6k/AR6003/hw2.1.1/bdata.WB31.bin          |  Bin 1792 -> 37 bytes
>  ath6k/AR6003/hw2.1.1/data.patch.bin          |  Bin 140 -> 37 bytes
>  ...5l41-dsp1-spk-cali-104312af-spkid1-l0.bin |  Bin 1976 -> 44 bytes
>  ...5l41-dsp1-spk-cali-104312af-spkid1-r0.bin |  Bin 1976 -> 44 bytes
>  ...5l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin |  Bin 1968 -> 44 bytes
>  ...5l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin |  Bin 1972 -> 44 bytes
>  ...5l41-dsp1-spk-prot-104312af-spkid1-l0.bin |  Bin 4920 -> 44 bytes
>  ...5l41-dsp1-spk-prot-104312af-spkid1-r0.bin |  Bin 4920 -> 44 bytes
>  ...5l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin |  Bin 4944 -> 44 bytes
>  ...5l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin |  Bin 4948 -> 44 bytes
>  ...5l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin |  Bin 5008 -> 44 bytes
>  ...5l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin |  Bin 5012 -> 44 bytes
>  i915/dg1_huc_7.9.3.bin                       |  Bin 589888 -> 11 bytes
>  i915/tgl_huc_7.9.3.bin                       |  Bin 589888 -> 11 bytes
>  intel/dsp_fw_glk_v3366.bin                   |  Bin 505608 -> 21 bytes
>  intel/dsp_fw_release_v3402.bin               |  Bin 247112 -> 20 bytes
>  intel/ibt-0040-1020.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-0040-2120.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-0040-4150.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-0041-0041.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-1040-0041.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-1040-1020.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-1040-2120.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-1040-4150.ddc                      |  Bin 9 -> 12 bytes
>  intel/ibt-17-1.ddc                           |  Bin 14 -> 14 bytes
>  intel/ibt-17-1.sfi                           |  Bin 625216 -> 14 bytes
>  intel/ibt-17-16-1.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-17-16-1.sfi                        |  Bin 675372 -> 12 bytes
>  intel/ibt-18-0-1.ddc                         |  Bin 14 -> 14 bytes
>  intel/ibt-18-0-1.sfi                         |  Bin 625216 -> 14 bytes
>  intel/ibt-18-1.ddc                           |  Bin 14 -> 14 bytes
>  intel/ibt-18-1.sfi                           |  Bin 625216 -> 14 bytes
>  intel/ibt-18-16-1.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-18-16-1.sfi                        |  Bin 675372 -> 12 bytes
>  intel/ibt-18-2.ddc                           |  Bin 9 -> 12 bytes
>  intel/ibt-18-2.sfi                           |  Bin 675372 -> 12 bytes
>  intel/ibt-19-0-0.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-19-0-1.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-19-0-1.sfi                         |  Bin 801128 -> 14 bytes
>  intel/ibt-19-0-3.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-19-0-3.sfi                         |  Bin 801128 -> 14 bytes
>  intel/ibt-19-0-4.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-19-0-4.sfi                         |  Bin 801128 -> 14 bytes
>  intel/ibt-19-16-4.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-19-16-4.sfi                        |  Bin 801128 -> 14 bytes
>  intel/ibt-19-240-1.ddc                       |  Bin 9 -> 12 bytes
>  intel/ibt-19-240-1.sfi                       |  Bin 801128 -> 14 bytes
>  intel/ibt-19-240-4.ddc                       |  Bin 9 -> 12 bytes
>  intel/ibt-19-240-4.sfi                       |  Bin 801128 -> 14 bytes
>  intel/ibt-19-32-0.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-19-32-0.sfi                        |  Bin 801128 -> 14 bytes
>  intel/ibt-19-32-1.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-19-32-1.sfi                        |  Bin 801128 -> 14 bytes
>  intel/ibt-19-32-4.ddc                        |  Bin 9 -> 12 bytes
>  intel/ibt-19-32-4.sfi                        |  Bin 801128 -> 14 bytes
>  intel/ibt-20-0-3.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-20-1-3.ddc                         |  Bin 9 -> 12 bytes
>  intel/ibt-20-1-4.ddc                         |  Bin 9 -> 12 bytes
>  libertas/gspi8686_v9_helper.bin              |  Bin 2140 -> 19 bytes
>  libertas/gspi8688_helper.bin                 |  Bin 2140 -> 19 bytes
>  mellanox/lc_ini_bundle_2010_1502.bin         |  Bin 12300 -> 27 bytes
>  mellanox/lc_ini_bundle_2010_3020.bin         |  Bin 12300 -> 27 bytes
>  mellanox/lc_ini_bundle_2010_3146.bin         |  Bin 12300 -> 27 bytes
>  meson/vdec/sm1_hevc_mmu.bin                  |  Bin 16384 -> 17 bytes
>  mrvl/sd8688_helper.bin                       |  Bin 2616 -> 29 bytes
>  mts_gsm.fw                                   |  Bin 13847 -> 11 bytes
>  nvidia/gp100/gr/sw_bundle_init.bin           |  Bin 7664 -> 33 bytes
>  nvidia/gp100/gr/sw_method_init.bin           |  Bin 11928 -> 33 bytes
>  nvidia/gp104/gr/gpccs_inst.bin               |  Bin 13307 -> 29 bytes
>  nvidia/gp108/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>  nvidia/gp108/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>  nvidia/gp108/gr/sw_bundle_init.bin           |  Bin 7680 -> 33 bytes
>  nvidia/gp108/gr/sw_ctx.bin                   |  Bin 6000 -> 25 bytes
>  nvidia/gp108/gr/sw_method_init.bin           |  Bin 12288 -> 33 bytes
>  nvidia/gp108/gr/sw_nonctx.bin                |  Bin 2496 -> 28 bytes
>  nvidia/gv100/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>  nvidia/gv100/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>  nvidia/gv100/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>  nvidia/tu102/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>  nvidia/tu102/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>  nvidia/tu102/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>  nvidia/tu102/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>  nvidia/tu104/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>  nvidia/tu104/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>  nvidia/tu104/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>  nvidia/tu104/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>  nvidia/tu106/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>  nvidia/tu106/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>  nvidia/tu106/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>  nvidia/tu106/gr/sw_nonctx.bin                |  Bin 3856 -> 28 bytes
>  nvidia/tu106/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>  nvidia/tu116/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>  nvidia/tu116/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>  nvidia/tu116/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>  nvidia/tu116/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>  nvidia/tu116/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>  nvidia/tu116/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>  nvidia/tu116/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>  nvidia/tu117/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>  nvidia/tu117/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>  nvidia/tu117/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>  nvidia/tu117/gr/sw_nonctx.bin                |  Bin 3856 -> 28 bytes
>  nvidia/tu117/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>  qca/hpnv21.302                               |  Bin 6830 -> 10 bytes
>  qca/hpnv21g.302                              |  Bin 6670 -> 11 bytes
>  qca/nvm_usb_00000201.bin                     |  Bin 1859 -> 20 bytes
>  qca/nvm_usb_00130200_0105.bin                |  Bin 6316 -> 25 bytes
>  qca/nvm_usb_00130200_0106.bin                |  Bin 6332 -> 20 bytes
>  qca/nvm_usb_00130200_0109.bin                |  Bin 6332 -> 20 bytes
>  qca/nvm_usb_00130200_0110.bin                |  Bin 6316 -> 25 bytes
>  qca/nvm_usb_00130201_010a.bin                |  Bin 6623 -> 20 bytes
>  qca/nvm_usb_00130201_010b.bin                |  Bin 6623 -> 20 bytes
>  qca/nvm_usb_00130201_0303.bin                |  Bin 6623 -> 20 bytes
>  qca/nvm_usb_00130201_gf_010a.bin             |  Bin 6463 -> 23 bytes
>  qca/nvm_usb_00130201_gf_010b.bin             |  Bin 6463 -> 23 bytes
>  qca/nvm_usb_00130201_gf_0303.bin             |  Bin 6463 -> 23 bytes
>  qca/rampatch_usb_00000201.bin                |  Bin 54432 -> 25 bytes
>  qcom/sm8250/adspr.jsn                        |   22 +-
>  qcom/sm8250/adspua.jsn                       |   28 +-
>  qcom/sm8250/cdspr.jsn                        |   22 +-
>  radeon/CAICOS_mc.bin                         |  Bin 24096 -> 12 bytes
>  radeon/CAICOS_me.bin                         |  Bin 5504 -> 12 bytes
>  radeon/CYPRESS_rlc.bin                       |  Bin 3072 -> 13 bytes
>  radeon/HAINAN_mc2.bin                        |  Bin 31452 -> 13 bytes
>  radeon/HAWAII_sdma.bin                       |  Bin 4200 -> 16 bytes
>  radeon/JUNIPER_me.bin                        |  Bin 5504 -> 14 bytes
>  radeon/JUNIPER_pfp.bin                       |  Bin 4480 -> 15 bytes
>  radeon/JUNIPER_rlc.bin                       |  Bin 3072 -> 13 bytes
>  radeon/KABINI_ce.bin                         |  Bin 8576 -> 14 bytes
>  radeon/KABINI_sdma.bin                       |  Bin 4200 -> 16 bytes
>  radeon/KAVERI_sdma.bin                       |  Bin 4200 -> 16 bytes
>  radeon/MULLINS_ce.bin                        |  Bin 8576 -> 13 bytes
>  radeon/MULLINS_me.bin                        |  Bin 8576 -> 13 bytes
>  radeon/MULLINS_sdma.bin                      |  Bin 4200 -> 16 bytes
>  radeon/OLAND_ce.bin                          |  Bin 8576 -> 13 bytes
>  radeon/OLAND_mc.bin                          |  Bin 31452 -> 13 bytes
>  radeon/OLAND_mc2.bin                         |  Bin 31452 -> 13 bytes
>  radeon/OLAND_me.bin                          |  Bin 8576 -> 13 bytes
>  radeon/PITCAIRN_ce.bin                       |  Bin 8576 -> 13 bytes
>  radeon/REDWOOD_pfp.bin                       |  Bin 4480 -> 13 bytes
>  radeon/REDWOOD_rlc.bin                       |  Bin 3072 -> 13 bytes
>  radeon/RV620_me.bin                          |  Bin 21504 -> 12 bytes
>  radeon/RV620_pfp.bin                         |  Bin 2304 -> 13 bytes
>  radeon/RV630_pfp.bin                         |  Bin 2304 -> 13 bytes
>  radeon/RV635_me.bin                          |  Bin 21504 -> 12 bytes
>  radeon/RV635_pfp.bin                         |  Bin 2304 -> 13 bytes
>  radeon/RV670_pfp.bin                         |  Bin 2304 -> 13 bytes
>  radeon/RV730_pfp.bin                         |  Bin 3392 -> 13 bytes
>  radeon/SUMO_me.bin                           |  Bin 5504 -> 12 bytes
>  radeon/TAHITI_ce.bin                         |  Bin 8576 -> 13 bytes
>  radeon/TAHITI_mc.bin                         |  Bin 31076 -> 15 bytes
>  radeon/TAHITI_me.bin                         |  Bin 8576 -> 15 bytes
>  radeon/TAHITI_pfp.bin                        |  Bin 8576 -> 16 bytes
>  radeon/TURKS_mc.bin                          |  Bin 24096 -> 12 bytes
>  radeon/TURKS_me.bin                          |  Bin 5504 -> 12 bytes
>  radeon/VERDE_ce.bin                          |  Bin 8576 -> 13 bytes
>  radeon/VERDE_mc.bin                          |  Bin 31076 -> 15 bytes
>  radeon/banks_k_2_smc.bin                     |  Bin 61932 -> 27 bytes
>  radeon/bonaire_k_smc.bin                     |  Bin 130796 -> 27 bytes
>  radeon/bonaire_mc.bin                        |  Bin 32336 -> 24 bytes
>  radeon/bonaire_rlc.bin                       |  Bin 8448 -> 25 bytes
>  radeon/bonaire_sdma.bin                      |  Bin 4456 -> 26 bytes
>  radeon/bonaire_sdma1.bin                     |  Bin 4456 -> 27 bytes
>  radeon/bonaire_smc.bin                       |  Bin 130796 -> 25 bytes
>  radeon/bonaire_uvd.bin                       |  Bin 232752 -> 25 bytes
>  radeon/bonaire_vce.bin                       |  Bin 101072 -> 25 bytes
>  radeon/hainan_k_smc.bin                      |  Bin 61876 -> 26 bytes
>  radeon/hainan_mc.bin                         |  Bin 31996 -> 23 bytes
>  radeon/hainan_smc.bin                        |  Bin 61444 -> 24 bytes
>  radeon/hawaii_k_smc.bin                      |  Bin 130796 -> 26 bytes
>  radeon/hawaii_mc.bin                         |  Bin 32796 -> 23 bytes
>  radeon/hawaii_rlc.bin                        |  Bin 8448 -> 24 bytes
>  radeon/hawaii_sdma.bin                       |  Bin 4456 -> 26 bytes
>  radeon/hawaii_sdma1.bin                      |  Bin 4456 -> 27 bytes
>  radeon/hawaii_smc.bin                        |  Bin 130796 -> 24 bytes
>  radeon/hawaii_uvd.bin                        |  Bin 232752 -> 25 bytes
>  radeon/hawaii_vce.bin                        |  Bin 101072 -> 25 bytes
>  radeon/kabini_rlc.bin                        |  Bin 10496 -> 24 bytes
>  radeon/kabini_sdma.bin                       |  Bin 4456 -> 26 bytes
>  radeon/kabini_sdma1.bin                      |  Bin 4456 -> 27 bytes
>  radeon/kabini_uvd.bin                        |  Bin 232752 -> 25 bytes
>  radeon/kabini_vce.bin                        |  Bin 101072 -> 25 bytes
>  radeon/kaveri_ce.bin                         |  Bin 8832 -> 13 bytes
>  radeon/kaveri_me.bin                         |  Bin 8832 -> 13 bytes
>  radeon/kaveri_rlc.bin                        |  Bin 10496 -> 24 bytes
>  radeon/kaveri_sdma.bin                       |  Bin 4456 -> 26 bytes
>  radeon/kaveri_sdma1.bin                      |  Bin 4456 -> 27 bytes
>  radeon/kaveri_uvd.bin                        |  Bin 232752 -> 25 bytes
>  radeon/kaveri_vce.bin                        |  Bin 101072 -> 25 bytes
>  radeon/mullins_ce.bin                        |  Bin 8832 -> 13 bytes
>  radeon/mullins_me.bin                        |  Bin 8832 -> 13 bytes
>  radeon/mullins_mec.bin                       |  Bin 17024 -> 14 bytes
>  radeon/mullins_pfp.bin                       |  Bin 8832 -> 14 bytes
>  radeon/mullins_rlc.bin                       |  Bin 10496 -> 25 bytes
>  radeon/mullins_sdma.bin                      |  Bin 4456 -> 26 bytes
>  radeon/mullins_sdma1.bin                     |  Bin 4456 -> 27 bytes
>  radeon/mullins_uvd.bin                       |  Bin 232752 -> 25 bytes
>  radeon/mullins_vce.bin                       |  Bin 101072 -> 25 bytes
>  radeon/oland_ce.bin                          |  Bin 8832 -> 13 bytes
>  radeon/oland_k_smc.bin                       |  Bin 62692 -> 25 bytes
>  radeon/oland_mc.bin                          |  Bin 31996 -> 22 bytes
>  radeon/oland_me.bin                          |  Bin 8832 -> 13 bytes
>  radeon/oland_smc.bin                         |  Bin 62260 -> 23 bytes
>  radeon/pitcairn_ce.bin                       |  Bin 8832 -> 13 bytes
>  radeon/pitcairn_k_smc.bin                    |  Bin 61712 -> 28 bytes
>  radeon/pitcairn_mc.bin                       |  Bin 31644 -> 25 bytes
>  radeon/pitcairn_me.bin                       |  Bin 8832 -> 13 bytes
>  radeon/pitcairn_smc.bin                      |  Bin 61280 -> 26 bytes
>  radeon/si58_mc.bin                           |  Bin 32488 -> 21 bytes
>  radeon/tahiti_ce.bin                         |  Bin 8832 -> 13 bytes
>  radeon/tahiti_k_smc.bin                      |  Bin 64364 -> 26 bytes
>  radeon/tahiti_mc.bin                         |  Bin 31776 -> 23 bytes
>  radeon/tahiti_me.bin                         |  Bin 8832 -> 13 bytes
>  radeon/tahiti_pfp.bin                        |  Bin 8832 -> 16 bytes
>  radeon/tahiti_smc.bin                        |  Bin 63932 -> 24 bytes
>  radeon/verde_ce.bin                          |  Bin 8832 -> 13 bytes
>  radeon/verde_k_smc.bin                       |  Bin 63804 -> 25 bytes
>  radeon/verde_mc.bin                          |  Bin 32044 -> 22 bytes
>  radeon/verde_smc.bin                         |  Bin 61776 -> 23 bytes
>  rtl_bt/rtl8821c_config.bin                   |  Bin 10 -> 19 bytes
>  rtl_bt/rtl8821cs_config.bin                  |  Bin 25 -> 19 bytes
>  rtl_bt/rtl8822cu_config.bin                  |  Bin 6 -> 20 bytes
>  rtl_bt/rtl8852au_config.bin                  |  Bin 6 -> 20 bytes
>  rtl_bt/rtl8852bu_config.bin                  |  Bin 6 -> 20 bytes
>  rtl_bt/rtl8852cu_config.bin                  |  Bin 6 -> 20 bytes
>  sms1xxx-nova-a-dvbt-01.fw                    |  Bin 85656 -> 28 bytes
>  ueagle-atm/CMVeiWO.bin                       |  Bin 161 -> 9 bytes
>  ueagle-atm/CMVepWO.bin                       |  Bin 151 -> 11 bytes
>  wfx/brd8023a.pds                             |  Bin 625 -> 12 bytes
>  344 files changed, 14 insertions(+), 17691 deletions(-)
>
> --
> Adrien
