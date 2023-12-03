package danny.store.dannystore.controller;

import danny.store.dannystore.domain.entity.District;
import danny.store.dannystore.domain.entity.Province;
import danny.store.dannystore.domain.entity.Wards;
import danny.store.dannystore.repository.DistrictRepository;
import danny.store.dannystore.repository.ProvinceRepository;
import danny.store.dannystore.repository.WardsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/address")
@RequiredArgsConstructor
public class AddressController {
    private final ProvinceRepository provinceRepository;
    private final DistrictRepository districtRepository;
    private final WardsRepository wardsRepository;
    @GetMapping("province")
    public List<Province> getListProvinces() {
        return provinceRepository.findAll();
    }
    @GetMapping("province/district")
    public List<District> getListDistrictOfProvince(@RequestParam Long provinceId) {
        return districtRepository.getListDistrictOfProvince(provinceId);
    }
    @GetMapping("province/district/wards")
    public List<Wards> getListWardsOfDistrict(@RequestParam Long districtId) {
        return wardsRepository.wardsRepository(districtId);
    }
}
